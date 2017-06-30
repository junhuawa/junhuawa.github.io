---
layout: post
title: "Guest STU Can't Startup"
category: "case"
tags: [case]
---
### Guest STU unit doesn't rise back to SP-EX state,1010 alarm comes

The problem is reported to OSP, block their milestone, so very urgent. Xiaolong and I go to help them with Wang Jianping.

When the NE's traffic is high(ZMCJ:ALL=N; cmd can check the load),  restart STU(guest unit in ACPI5 VMU) will cause it never startup to WO/SP-EX again.
Found STU always stay in iPXE dhcp stage. Cannot get IP from the dhcp server.

Spend 12 hours to solve the problem. 

#### Analysis:

DHCP protocol based on UDP protocol. Procedure is DHCP discover, DHCP offer, then DHCP request, ...;
Catch packets from OMU found the DHCP discover and DHCP offer are monitered. There is DHCP offer, but ipxe in guest unit can't receive.

In the iPXE's igbvf code, add debug print to show the packets header it receive when the problem happen. We found it always receive emb messages, the emb address of the msg
is 0x70 - 0x75, it's msgs related to the IPDU units.

So the problem should be that IPDU's msg occupy the iPXE's igbvf receive buffer, so the DHCP offer packet is lost.

Question is why STU's ethernet card can receive the msg of IPDU although the packet's destination address is not the STU units.
So, we guess it's because the guest STU's ethernet card's promisc mode is enabled.

Read iPXE code by Yi Xiaolong, in SS_LNXvmanakvm/rom/ipxe-1.0.0+-dmx-3/src/drivers/net/igbvf/igbvf_main.c
In the igbvf_open function, there is no call to set the promisc mode. But in the code of igbvf driver in linux, it has the set function when call igbvf_open.
in Calling igbvf_set_rx_mode(netdev), 
And we found in the igbvf_vf.c, there is similar function: igbvf_promisc_set_vf(struct e1000_hw *hw, enum e1000_promisc_type type)
So, just try, in the igbvf_open function, call igbvf_promisc_set_vf(&adapter->hw, e1000_promisc_disabled); testing, found it works!

Check igb driver in VMU and iPXE code in STU, found there is no obvious error.
Check ETHLIB code, found there is an error:

ethsiogx.c:

```c
static error_t sio_set_pkt_filter(eth_dev__t  *edp)
else
{
    /* the only other possibility is ENET_ADDR_CMD_T_REJ_ALL_MA_C */
    vmolr |= SIO_VF_VMOLR_RESET_ROMPE;
}
/* furthermore ENET_ADDR_CMD_T_ACC_ALL_MA_C is not an option */
vmolr |= SIO_VF_VMOLR_RESET_MPE;
```

ethsiogx.h:

    #define SIO_VF_VMOLR_RESET_MPE    (1 << 28) /* Disable prom. multicasts */

Here to disable promisc mode, we should set VMOLR to 0, not 1. 0 means disable promisc mode, refer to

Intel® 82576EB Gigabit Ethernet Controller Datasheet.pdf


\[junhuawa@Tesla]$cat cpio.conf |grep pxe

    file /opt/vmanakvm/pxe-igbvf.rom ../src/qemu-kvm/qemu/pc-bios/pxe-igbvf.rom 0644 0 0

### Compile iPXE with debug info

make DEBUG=dhcp:3,rdtsc_timer:3 bin/igbvf.rom

make bin/rtl8139.dsk DEBUG=pci,buffer,heap

make bin/igbvf.rom

/ipxe-1.0.0+-dmx-3

10.68.203.96

iperf/netperf

ip link show

#### Test Network traffic bandwidth by iperf cmd:

client connect to the server:

    ./iperf -c 192.168.1.1 -i 5 -t 3600

server
     ./iperf -s
     
Need ip address set between 2 units.


ifconfig %s promisc up

### Check code igbvf_write_mbx_vf

    igb_main.c:     vmolr |= (E1000_VMOLR_ROPE | E1000_VMOLR_MPME);^M
    igb_main.c:         vmolr |= E1000_VMOLR_MPME;^M
    igb_main.c:             vmolr |= E1000_VMOLR_MPME;^M
    igb_main.c:          ~(E1000_VMOLR_ROPE | E1000_VMOLR_MPME | E1000_VMOLR_ROMPE);^M
    igb_main.c: vmolr &= ~(E1000_VMOLR_ROPE | E1000_VMOLR_ROMPE | E1000_VMOLR_MPME);^M
    igb_main.c:     vmolr |= E1000_VMOLR_MPME;^M
    igb_main.c:         vmolr |= E1000_VMOLR_MPME;^M
    igb_main.c:     vmolr &= ~(E1000_VMOLR_ROMPE | E1000_VMOLR_MPME);^M
    igb_main.c:         vmolr |= E1000_VMOLR_MPME;^M
    igb_main.c:     vmolr |= E1000_VMOLR_MPME;^M
    igb_main.c:     vmolr &= ~E1000_VMOLR_MPME;^M
    igb_vmdq.c: vmolr &= ~(E1000_VMOLR_UPE | E1000_VMOLR_MPME |^M
    igb_vmdq.c:         vmolr |= E1000_VMOLR_MPME;^M
    e1000_82575.h:#define E1000_VMOLR_MPME  0x10000000 /* Multicast promiscuous mode */^M

### Network interface filter:

    MAC filter
    VLAN filter
    packet -> filter -> FIFO queue -> enter different queue; Receive packets.

### Makefile used to compile the igb kernel module:

Set env to build the kernel module, then set KDIR and PWD variable value.

```makefile
    obj-m := igb.o
    igb-objs := igb_main.o igb_ethtool.o igb_param.o \
         e1000_82575.o e1000_mac.o e1000_nvm.o e1000_phy.o e1000_mbx.o \
         e1000_api.o e1000_manage.o kcompat.o

    KDIR := /home/xiayi/windriver_3_107_0/distro_build/work_nsn_acpi4_wr4/build/linux-nsn_acpi4-standard-build/
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
