---
layout: post
title: "Guest unit can't rise back to normal state"
date: 2015-02-09
category: "linux" 
tags: [misc]
---

#### Phenomenon of the problem

When changing spare STU unit to from SP-EX state to TE-EX state and then trying chage it back to SP-EX state.
STU doesn't rise back to SP-EX state.

Virtual service terminal session can see only

    Connection timed out (http://ipxe.org/4c106035)net1: 02:00:00:80:03:30 using i350vf on PCI00:06.0 (open) [Link:up, TX:0 TXE:0 RX:0 RXE:0]DHCP (net1 02:00:00:80:03:30).................. Connection timed out

This problem occurs only when traffic is ongoing in network element.
6.5MBHCA stability test traffic used.

New blade use in VMU.

After traffic stopped, STU comes automatically back to SP-EX state. Not checked how
much traffic need to be decreased to get with traffic STU back to SP-EX state.

#### Root Cause

 The igbvf driver of iPXE use the default value and default value is promisc
 mode, it trigger huge packages received on emb0/emb1 ports, then DHCP offer
 package can't be detected and can't connect to DHCP server.

 Description of the correction (incl. risk analysis): The igbvf driver in iPXE
 disable promisc mode, filter packages in MAC level.

#### Testing the network traffic bandwidth by `iperf`

    ip link show

Client connect to the server:

    ./iperf -c 192.168.1.1 -i 5 -t 3600

Server side:

     ./iperf -s

Need ip address set between 2 units.


#### Problem Analysis by Xiaoyi

STU is a guest unit in the VMU based on a new board type ACPI5;
When the NE's traffic is high,  restart STU will cause it never startup to WO/SP-EX again.
Found STU always stay in iPXE dhcp stage. Cannot get IP from the dhcp server.

##### Analysis

DHCP protocol based on UDP protocol. Procedure is DHCP discover, DHCP offer, then DHCP request, ...;

Catch packets from OMU found the DHCP discover and DHCP offer are monitered. There is DHCP offer, but ipxe in guest unit can't receive.

In the iPXE's igbvf code, add debug print to show the packets header it receive when the problem happen. We found it always receive emb messages, the emb address of the msg
is 0x70 - 0x75, it's msgs related to the IPDU units.

So the problem should be that IPDU's msg occupy the iPXE's igbvf receive buffer, so the DHCP offer packet is lost.
Question is why STU's ethernet card can receive the msg of IPDU although the packet's destination address is not the STU units.
So, we guess it's because the guest STU's ethernet card's promisc mode is enabled.

Read iPXE code by Xiaoyi, in vmanakvm/rom/ipxe-1.0.0+-dmx-3/src/drivers/net/igbvf/igbvf_main.c,
In the igbvf_open function, there is no call to set the promisc mode.
But in the code of igbvf driver in linux, it has the set function when call igbvf_open.

    in Calling igbvf_set_rx_mode(netdev)

And we found in the igbvf_vf.c, there is similar function: 

    igbvf_promisc_set_vf(struct e1000_hw *hw, enum e1000_promisc_type type)

So, just try, in the igbvf_open function, call igbvf_promisc_set_vf(&adapter->hw, e1000_promisc_disabled); testing, found it works!

Check igb driver in VMU and iPXE code in STU, found there is no obvious error.

Check ETHLIB code, found there is an error:

```c
    ethsiogx.c:
     static error_t sio_set_pkt_filter(eth_dev__t  *edp)
         else
    {
        /* the only other possibility is ENET_ADDR_CMD_T_REJ_ALL_MA_C */
        vmolr |= SIO_VF_VMOLR_RESET_ROMPE;
    }
    /* furthermore ENET_ADDR_CMD_T_ACC_ALL_MA_C is not an option */
    vmolr |= SIO_VF_VMOLR_RESET_MPE;
    ethsiogx.h:
     #define SIO_VF_VMOLR_RESET_MPE    
     (1 << 28) /* Disable prom. multicasts */
```c

Here to disable promisc mode, we should set VMOLR to 0, not 1. 0 means disable promisc mode, refer to

All spend 12 hours. 

#### Makefile used to compile the igb kernel module

Set env to build the kernel module, then set KDIR and PWD variable value.

```makefile
    obj-m := igb.o

    igb-objs := igb_main.o igb_ethtool.o igb_param.o \
        e1000_82575.o e1000_mac.o e1000_nvm.o e1000_phy.o e1000_mbx.o \
        e1000_api.o e1000_manage.o kcompat.o

    KDIR := /home/xxx/windriver_3_107_0/distro_build/work_board_wr4/build/linux-board-standard-build/
    PWD := $(shell pwd)

    default:
        $(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules
        
    clean:
        rm -f *.ko
        rm *.o
        rm *.mod.c
        rm .*cmd
        rm -r .tmp_versions
```

Intel® 82576EB Gigabit Ethernet Controller Datasheet.pdf
