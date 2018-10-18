Insert Guest Additions CD Image 报错:  

    Could not mount the media/drive '/usr/share/virtualbox/VBoxGuestAdditions.iso'
    (VERR_PDM_MEDIA_LOCKED).

Root cause 是因为光盘里已经有一个image, 即安装时那个CentOS的image.
将其去除就OK了. 

[SAMBA](http://www.linuxidc.com/Linux/2017-03/141390.html)

[GNOME](http://www.linuxidc.com/Linux/2015-12/126612.htm)

[No Host only adapter selected](ttps://askubuntu.com/questions/198452/no-host-only-adapter-selected)

/lib/systemd/system/multi-user.target

yum groupinstall "X Window System"
