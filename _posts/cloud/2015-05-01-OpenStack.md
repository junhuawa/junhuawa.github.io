---
layout: post
title: "OpenStack"
date: 2015-05-01
category: "cloud" 
tags: [openstack]
---

nova --os-tenant-name Yellow-VSP2.0 list

nova --os-tenant-name Yellow-VSP2.0 show 40b15bc9-f323-4aad-90e7-b138367fe786 -- show the instance's running host

Get the console of the running VM:

    virsh console instance-00000123 --devname serial1 

nova --os-tenant-name Yellow-VSP2.0 show instance-00000095  -- not work, use ID instead
    40b15bc9-f323-4aad-90e7-b138367fe786

  <interface type="bridge">
      <mac address="fa:16:3e:7a:24:07"/>
      <model type="virtio"/>
      <source bridge="qbr13b5aad9-89"/>
      <target dev="tap13b5aad9-89"/>
    </interface>
-->
	 <interface type='bridge'>
      <mac address='fa:16:3e:be:8d:8d'/>
      <source bridge='qbr56f53553-a7'/>
      <target dev='tap56f53553-a7'/>
      <model type='virtio'/>
      <rom bar='off' file=''/>
      <address type='pci' domain='0x0000' bus='0x00' slot='0x03' function='0x0'/>
    </interface>

	
	instance-00000095

### The instance name was defined in libvirt.xml

    [root@lcc-compute-7 ~]# cd /var/lib/nova/instances/40b15bc9-f323-4aad-90e7-b138367fe786/
    [root@lcc-compute-7 40b15bc9-f323-4aad-90e7-b138367fe786]# ls
    console.log  disk  disk.info  libvirt.xml
    [root@lcc-compute-7 40b15bc9-f323-4aad-90e7-b138367fe786]#

### virsh sub commands:

    destroy instance-00000095 
    start instance-00000095 
    edit instance-00000095  -- edit it's XML configuration file 

The first Openstack pilot was use openstack's cmd to config it's xml configuration;
the second one use openstack's framwork to create the config file, so can't modify xml file easily/mannually

libvirt.xml config file desc:

    http://libvirt.org/formatdomain.html#elements

### Guest unit's iPXE was stored in below directory by default:

    [root@lcc-controller qemu-kvm(keystone_admin)]# pwd
    /usr/share/qemu-kvm
    [root@lcc-controller qemu-kvm(keystone_admin)]# ls -l
    total 28
    lrwxrwxrwx 1 root root   19 May 19 22:45 bios.bin -> ../seabios/bios.bin
    -rw-r--r-- 1 root root 1536 Apr 23 02:11 extboot.bin
    drwxr-xr-x 2 root root 4096 May 19 22:45 keymaps
    -rw-r--r-- 1 root root 1024 Apr 23 02:11 linuxboot.bin
    -rw-r--r-- 1 root root 1024 Apr 23 02:11 multiboot.bin
    lrwxrwxrwx 1 root root   24 May 19 22:45 pxe-e1000.bin -> ../gpxe/e1000-0x100e.rom
    lrwxrwxrwx 1 root root   19 May 19 22:45 pxe-ne2k_pci.bin -> ../gpxe/rtl8029.rom
    lrwxrwxrwx 1 root root   19 May 19 22:45 pxe-pcnet.bin -> ../gpxe/pcnet32.rom
    lrwxrwxrwx 1 root root   19 May 19 22:45 pxe-rtl8139.bin -> ../gpxe/rtl8139.rom
    lrwxrwxrwx 1 root root   22 May 19 22:45 pxe-virtio.bin -> ../gpxe/virtio-net.rom
    lrwxrwxrwx 1 root root   22 May 19 22:45 sgabios.bin -> ../sgabios/sgabios.bin
    -rw-r--r-- 1 root root 8960 Apr 23 02:11 vapic.bin
    lrwxrwxrwx 1 root root   34 May 19 22:45 vgabios.bin -> ../vgabios/VGABIOS-lgpl-latest.bin
    lrwxrwxrwx 1 root root   41 May 19 22:45 vgabios-cirrus.bin -> ../vgabios/VGABIOS-lgpl-latest.cirrus.bin
    lrwxrwxrwx 1 root root   38 May 19 22:45 vgabios-qxl.bin -> ../vgabios/VGABIOS-lgpl-latest.qxl.bin
    lrwxrwxrwx 1 root root   41 May 19 22:45 vgabios-stdvga.bin -> ../vgabios/VGABIOS-lgpl-latest.stdvga.bin
    lrwxrwxrwx 1 root root   41 May 19 22:45 vgabios-vmware.bin -> ../vgabios/VGABIOS-lgpl-latest.vmware.bin

When the guest unit is up, the gPXE in the NIC will be executed first, so, 
it will damage the memory which was for loadchain when loading from memory.

PR 109656ESPE01: "CHAIN NOT OK, STATUS = 277B" prints in unit booting process

[root@lcc-controller ~(keystone_admin)]# keystone tenant-list
+----------------------------------+-----------------+---------+
|                id                |       name      | enabled |
+----------------------------------+-----------------+---------+
| 316bf7323816428f933c96446a7fe1e2 |    BYD-VSP2.0   |   True  |
| 2cfe335ed4e04fc693f014cc98ab0f22 |    Gmc-VSP2.0   |   True  |
| 451a223588764d7e8857d2da176d9b0a | Godzilla-VSP3.0 |   True  |
| 8bfb02fb1eef48d1bf853c8c703bdb6a |   Skoda-VSP2.0  |   True  |
| 83b47ec23f214ace84a190108cd19fc5 |      admin      |   True  |
| 98554fc7252f48a692dfb9e2809b1b1c |     services    |   True  |
+----------------------------------+-----------------+---------+

 http://docs.openstack.org/openstack-ops/content/user_facing_images.html#add_images

 [root@lcc-controller ~(keystone_admin)]# nova --os-tenant-name Yellow-VSP2.0 show 454ad1eb-7bff-4f8e-8fc7-fac02ef1537a
+--------------------------------------+----------------------------------------------------------+
| Property                             | Value                                                    |
+--------------------------------------+----------------------------------------------------------+
| OS-DCF:diskConfig                    | AUTO                                                     |
| OS-EXT-AZ:availability_zone          | nova                                                     |
| OS-EXT-SRV-ATTR:host                 | lcc-controller                                           |
| OS-EXT-SRV-ATTR:hypervisor_hostname  | lcc-controller                                           |
| OS-EXT-SRV-ATTR:instance_name        | instance-000001e1                                        |
| OS-EXT-STS:power_state               | 1                                                        |
| OS-EXT-STS:task_state                | -                                                        |
| OS-EXT-STS:vm_state                  | active                                                   |
| OS-SRV-USG:launched_at               | 2014-09-25T06:13:17.000000                               |
| OS-SRV-USG:terminated_at             | -                                                        |
| VSP2.0EL4-Net network                | 10.10.4.190                                              |
| VSP2.0EL5-Net network                | 10.10.5.192                                              |
| Yellow_EL0 network                   | 10.20.0.21                                               |
| Yellow_EL1 network                   | 10.20.1.21                                               |
| Yellow_EMB0 network                  | 10.200.206.9                                             |
| Yellow_EMB1 network                  | 10.200.208.5                                             |
| accessIPv4                           |                                                          |
| accessIPv6                           |                                                          |
| config_drive                         |                                                          |
| created                              | 2014-09-10T08:19:26Z                                     |
| flavor                               | m1.medium (9dc57a32-f397-4c0d-a60f-0bdd71332a57)         |
| hostId                               | 4927a7bb7ccac58cc240ddaab77e0b60ee036a5390be638460f9f946 |
| id                                   | 454ad1eb-7bff-4f8e-8fc7-fac02ef1537a                     |
| image                                | YellowBootImg (77f87a1c-fb44-4f53-8fb6-cf65244919e9)     |
| key_name                             | -                                                        |
| metadata                             | {}                                                       |
| name                                 | Yellow_IPDU-2                                            |
| os-extended-volumes:volumes_attached | [{"id": "8212eed4-6789-4e2a-b869-6bb1f4f2f817"}]         |
| progress                             | 0                                                        |
| security_groups                      | default                                                  |
| status                               | ACTIVE                                                   |
| tenant_id                            | d766d1311cc74745bc8b6929da7d329a                         |
| updated                              | 2014-09-25T06:13:17Z                                     |
| user_id                              | a19ca54e71c34e9187879b20a5dcae09                         |
| vcpus                                | 2                                                        |
+--------------------------------------+----------------------------------------------------------+
[root@lcc-controller ~(keystone_admin)]#

[root@lcc-controller 454ad1eb-7bff-4f8e-8fc7-fac02ef1537a(keystone_admin)]# pwd
/var/lib/nova/instances/454ad1eb-7bff-4f8e-8fc7-fac02ef1537a
    <disk type="block" device="disk">
      <driver name="qemu" type="raw" cache="none"/>
      <source dev="/dev/disk/by-path/ip-192.168.119.9:3260-iscsi-iqn.2010-10.org.openstack:volume-8212eed4-6789-4e2a-b869-6bb1f4f2f817-lun-1"/>
      <target bus="virtio" dev="vdb"/>
      <serial>8212eed4-6789-4e2a-b869-6bb1f4f2f817</serial>

[root@lcc-controller 454ad1eb-7bff-4f8e-8fc7-fac02ef1537a(keystone_admin)]# cinder --os-tenant-name Yellow-VSP2.0 list
+--------------------------------------+--------+----------------+------+-------------+----------+--------------------------------------+
|                  ID                  | Status |  Display Name  | Size | Volume Type | Bootable |             Attached to              |
+--------------------------------------+--------+----------------+------+-------------+----------+--------------------------------------+
| 413a0433-ba69-41ff-a158-a493eaf08113 | in-use |  GPLU-0-DISK   |  1   |     raw     |   true   | 21fd2dec-0c70-41d3-ac61-47ea0ddba28d |
| 8212eed4-6789-4e2a-b869-6bb1f4f2f817 | in-use |  IPDU-0-DISK   |  1   |     raw     |   true   | 454ad1eb-7bff-4f8e-8fc7-fac02ef1537a |
| e2eed33f-88f5-421d-93c8-7c60a7911a79 | error  | TestLinuxImage |  1   |     None    |  false   |                                      |
+--------------------------------------+--------+----------------+------+-------------+----------+--------------------------------------+

https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux_OpenStack_Platform/2/html/Getting_Started_Guide/ch16s03.html

### Detach/attach disk volume to the Virtual machine

    nova volume-detach <instanceid> <volumeid>
    nova volume-attach b8d5c952-f2fc-4556-83f2-57c79378d867 15a9f901-ba9d-45e1-8622-a5438473ae76 auto

glance image-list

[root@lcc-controller ~(keystone_admin)]# nova --os-tenant-name Yellow-VSP2.0 show e867120e-dd18-44f0-99bd-2fcae3f72e75
+--------------------------------------+----------------------------------------------------------+
| Property                             | Value                                                    |
+--------------------------------------+----------------------------------------------------------+
| OS-DCF:diskConfig                    | AUTO                                                     |
| OS-EXT-AZ:availability_zone          | nova                                                     |
| OS-EXT-SRV-ATTR:host                 | lcc-compute-8                                            |
| OS-EXT-SRV-ATTR:hypervisor_hostname  | lcc-compute-8                                            |
| OS-EXT-SRV-ATTR:instance_name        | instance-000001df                                        |
| OS-EXT-STS:power_state               | 1                                                        |
| OS-EXT-STS:task_state                | -                                                        |
| OS-EXT-STS:vm_state                  | active                                                   |
| OS-SRV-USG:launched_at               | 2014-09-25T02:00:43.000000                               |
| OS-SRV-USG:terminated_at             | -                                                        |
| VSP2.0EL4-Net network                | 10.10.4.188                                              |
| VSP2.0EL5-Net network                | 10.10.5.190                                              |
| Yellow_EL0 network                   | 10.20.0.19                                               |
| Yellow_EL1 network                   | 10.20.1.19                                               |
| Yellow_EMB0 network                  | 10.200.206.21                                            |
| Yellow_EMB1 network                  | 10.200.208.14                                            |
| accessIPv4                           |                                                          |
| accessIPv6                           |                                                          |
| config_drive                         |                                                          |
| created                              | 2014-09-10T08:18:30Z                                     |
| flavor                               | m1.medium (9dc57a32-f397-4c0d-a60f-0bdd71332a57)         |
| hostId                               | 1ace200af5fe9cf105592301d3092c2cb54fae4384c77faf3f1897de |
| id                                   | e867120e-dd18-44f0-99bd-2fcae3f72e75                     |
| image                                | YellowBootImg (77f87a1c-fb44-4f53-8fb6-cf65244919e9)     |
| key_name                             | -                                                        |
| metadata                             | {}                                                       |
| name                                 | Yellow_IPDU-0                                            |
| os-extended-volumes:volumes_attached | []                                                       |
| progress                             | 0                                                        |
| security_groups                      | default                                                  |
| status                               | ACTIVE                                                   |
| tenant_id                            | d766d1311cc74745bc8b6929da7d329a                         |
| updated                              | 2014-09-25T02:00:43Z                                     |
| user_id                              | a19ca54e71c34e9187879b20a5dcae09                         |
| vcpus                                | 2     

[root@lcc-compute-8 e867120e-dd18-44f0-99bd-2fcae3f72e75]# diff libvirt.xml ~/libvirt_for_ipdu-0_with_vda.xml

    36,41d35
    <     <disk type="block" device="disk">
    <       <driver name="qemu" type="raw" cache="none"/>
    <       <source dev="/dev/disk/by-path/ip-192.168.119.9:3260-iscsi-iqn.2010-10.org.openstack:volume-63701bca-65eb-4f80-90ab-09b5487abb4c-lun-1"/>
    <       <target bus="virtio" dev="vdb"/>
    <       <serial>63701bca-65eb-4f80-90ab-09b5487abb4c</serial>
    <     </disk>

[root@lcc-compute-8 e867120e-dd18-44f0-99bd-2fcae3f72e75]#

### Create volumes:

	- $ source ~/keystonerc_admin
	- $ cinder create --display_name NAME SIZE
	- cinder list
 
### Attach the Volume

	nova volume-attach INSTANCE_ID VOLUME_ID auto

[root@lcc-compute-8 ~(keystone_admin)]# nova volume-attach e867120e-dd18-44f0-99bd-2fcae3f72e75 63701bca-65eb-4f80-90ab-09b5487abb4c auto
+----------+--------------------------------------+
| Property | Value                                |
+----------+--------------------------------------+
| device   | /dev/vdb                             |
| id       | 63701bca-65eb-4f80-90ab-09b5487abb4c |
| serverId | e867120e-dd18-44f0-99bd-2fcae3f72e75 |
| volumeId | 63701bca-65eb-4f80-90ab-09b5487abb4c |
+----------+--------------------------------------+

### Detach a volume 

    nova volume-detach <instanceid> <volumeid>

\# udevadm monitor --property > /home/root/udev.log

    UDEV  [1412197582.721279] add      /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A03:00/d
    evice:23 (acpi)
    UDEV_LOG=3
    ACTION=add
    DEVPATH=/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A03:00/device:23
    SUBSYSTEM=acpi
    MODALIAS=acpi:device:
    SEQNUM=989

    KERNEL[1412197582.722468] add      /devices/pci0000:00/0000:00:0f.0 (pci)
    UDEV_LOG=3
    ACTION=add
    DEVPATH=/devices/pci0000:00/0000:00:0f.0
    SUBSYSTEM=pci
    PCI_CLASS=10000
    PCI_ID=1AF4:1001
    PCI_SUBSYS_ID=1AF4:0002
    PCI_SLOT_NAME=0000:00:0f.0
    MODALIAS=pci:v00001AF4d00001001sv00001AF4sd00000002bc01sc00i00
    SEQNUM=990

    UDEV  [1412197582.728687] add      /devices/pci0000:00/0000:00:0f.0 (pci)
    UDEV_LOG=3
    ACTION=add
    DEVPATH=/devices/pci0000:00/0000:00:0f.0
    SUBSYSTEM=pci
    PCI_CLASS=10000
    PCI_ID=1AF4:1001
    PCI_SUBSYS_ID=1AF4:0002
    PCI_SLOT_NAME=0000:00:0f.0
    MODALIAS=pci:v00001AF4d00001001sv00001AF4sd00000002bc01sc00i00
    SEQNUM=990

    KERNEL[1412197582.732147] add      /devices/pci0000:00/0000:00:0f.0/virtio11 (vi
    rtio)
    UDEV_LOG=3
    ACTION=add
    DEVPATH=/devices/pci0000:00/0000:00:0f.0/virtio11
    SUBSYSTEM=virtio
    MODALIAS=virtio:d00000002v00001AF4
    SEQNUM=991

    UDEV  [1412197582.732414] add      /devices/pci0000:00/0000:00:0f.0/virtio11 (vi
    rtio)
    UDEV_LOG=3
    ACTION=add
    DEVPATH=/devices/pci0000:00/0000:00:0f.0/virtio11
    SUBSYSTEM=virtio
    MODALIAS=virtio:d00000002v00001AF4
    SEQNUM=991

    KERNEL[1412197582.746295] add      /devices/pci0000:00/0000:00:0f.0/virtio11/blo
    ck/vde (block)
    UDEV_LOG=3
    ACTION=add
    DEVPATH=/devices/pci0000:00/0000:00:0f.0/virtio11/block/vde
    SUBSYSTEM=block
    DEVNAME=vde
    DEVTYPE=disk
    SEQNUM=992
    MAJOR=253
    MINOR=64

    KERNEL[1412197582.746417] add      /devices/virtual/bdi/253:64 (bdi)
    UDEV_LOG=3
    ACTION=add
    DEVPATH=/devices/virtual/bdi/253:64
    SUBSYSTEM=bdi
    SEQNUM=993

    UDEV  [1412197582.746618] add      /devices/pci0000:00/0000:00:0f.0/virtio11/blo
    ck/vde (block)
    UDEV_LOG=3
    ACTION=add
    DEVPATH=/devices/pci0000:00/0000:00:0f.0/virtio11/block/vde
    SUBSYSTEM=block
    DEVNAME=/dev/vde
    DEVTYPE=disk
    SEQNUM=992
    MAJOR=253
    MINOR=64

    UDEV  [1412197582.746638] add      /devices/virtual/bdi/253:64 (bdi)
    UDEV_LOG=3
    ACTION=add
    DEVPATH=/devices/virtual/bdi/253:64
    SUBSYSTEM=bdi
    SEQNUM=993

cat /proc/partitions |grep -v 4096i|grep "vd"|awk '{print $4;}' |grep [1-9]


[root@lcc-controller ~(keystone_admin)]# ifconfig |grep 192.168

          inet addr:192.168.119.10  Bcast:192.168.119.255  Mask:255.255.255.0
          inet addr:192.168.122.1  Bcast:192.168.122.255  Mask:255.255.255.0

ssh 192.168.119.10 username/password: root/root

| d602cd8d-fe11-46e2-bee7-26f8c16c7c2b | MixServer  | ACTIVE  | -          | Running     | VSP2.0EL5-Net=10.10.5.85; VSP2.0EL4-Net=10.10.4.86; Gmc_EL0=10.20.0.12; Gmc_EL1=10.20.1.12; VSP2.0MML-Net=10.56.120.111  

### udev rule added

    /lib/udev/rules.d
    root@ubuntu:/dev/disk/by-id# pwd
    /dev/disk/by-id
    root@ubuntu:/dev/disk/by-id# ls
    dm-name-ubuntu--vg-root    dm-uuid-LVM-KR9K2ZaLFQd6hQ6treCpMNvbwrdSRibmBTXNI6ebiL8tAlcDbEeZ2v3lmKNjZ5QG  virtio-9d8a0213-e9af-4a77-8-part1
    dm-name-ubuntu--vg-swap_1  dm-uuid-LVM-KR9K2ZaLFQd6hQ6treCpMNvbwrdSRibmf7KkCDDLvFMrlyS5s3UfBvePmgDzdgq8
    root@ubuntu:/dev/disk/by-id#
    KERNEL=="vd*[0-9]", ATTRS{serial}=="?*", ENV{ID_SERIAL}="$attr{serial}", SYMLINK+="disk/by-id/virtio-$env{ID_SERIAL}-part%n"

http://www.cnblogs.com/youjianxiaoxiang/archive/2012/12/18/2823511.html

### Monitor udev events

    udevadm monitor --property >udev.log

[root@mme-controller ~(keystone_admin)]# nova volume-create  --display-name test --volume-type TEST --availability-zone nova 1
+---------------------+--------------------------------------+
| Property            | Value                                |
+---------------------+--------------------------------------+
| attachments         | []                                   |
| availability_zone   | nova                                 |
| bootable            | false                                |
| created_at          | 2014-10-16T05:54:34.796306           |
| display_description | -                                    |
| display_name        | test                                 |
| encrypted           | False                                |
| id                  | 7f40c705-8d42-4ef3-b466-092d6950a353 |
| metadata            | {}                                   |
| size                | 1                                    |
| snapshot_id         | -                                    |
| source_volid        | -                                    |
| status              | creating                             |
| volume_type         | TEST                                 |
+---------------------+--------------------------------------+

### udev rules in ubuntu for virtio volume

    ubuntu@ubuntu:/dev/disk/by-id$ cd /lib/udev/rules.d/
    ubuntu@ubuntu:/lib/udev/rules.d$ grep virtio *
    50-udev-default.rules:SUBSYSTEM=="virtio-ports", KERNEL=="vport*", ATTR{name}=="?*", SYMLINK+="virtio-ports/$attr{name}"
    60-persistent-storage.rules:# virtio-blk
    60-persistent-storage.rules:KERNEL=="vd*[!0-9]", ATTRS{serial}=="?*", ENV{ID_SERIAL}="$attr{serial}", SYMLINK+="disk/by-id/virtio-$env{ID_SERIAL}"
    60-persistent-storage.rules:KERNEL=="vd*[0-9]", ATTRS{serial}=="?*", ENV{ID_SERIAL}="$attr{serial}", SYMLINK+="disk/by-id/virtio-$env{ID_SERIAL}-part%n"

In our uevent events, there is no disk's id info in the events, so, we can't get the disk's id in the LOGU.
