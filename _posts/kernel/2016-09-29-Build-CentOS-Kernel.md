---
layout: post
title: "Build CentOS7 Kernel"
date: 2016-09-29
category: "kernel" 
tags: [kernel]
---
### Build CentOS7 kernel

https://wiki.centos.org/HowTos/Custom_Kernel
https://wiki.centos.org/HowTos/I_need_the_Kernel_Source

### Rebuild kernel

cd ~/rpmbuild/SPECS
[junhuawa@Tesla SPECS]$ rpmbuild -bb --target=`uname -m` kernel.spec --with baseonly --without debug --without debuginfo

     Obsoletes: cpupowerutils-devel < 1:009-0.6.p1
     Processing files: kernel-devel-3.10.0-327.el7.x86_64
     Provides: kernel-devel-x86_64 = 3.10.0-327.el7 kernel-devel-uname-r = 3.10.0-327.el7.x86_64 kernel-devel = 3.10.0-327.el7 kernel-devel(x86-64) = 3.10.0-327.el7
     Requires(interp): /bin/sh
     Requires(rpmlib): rpmlib(PartialHardlinkSets) <= 4.0.4-1 rpmlib(FileDigests) <= 4.6.0-1 rpmlib(PayloadFilesHavePrefix) <= 4.0-1 rpmlib(CompressedFileNames) <= 3.0.4-1
     Requires(pre): /usr/bin/find
     Requires(post): /bin/sh
     Checking for unpackaged file(s): /usr/lib/rpm/check-files /home/junhuawa/rpmbuild/BUILDROOT/kernel-3.10.0-327.el7.x86_64
     Wrote: /home/junhuawa/rpmbuild/RPMS/x86_64/kernel-3.10.0-327.el7.x86_64.rpm
     Wrote: /home/junhuawa/rpmbuild/RPMS/x86_64/kernel-headers-3.10.0-327.el7.x86_64.rpm
     Wrote: /home/junhuawa/rpmbuild/RPMS/x86_64/perf-3.10.0-327.el7.x86_64.rpm
     Wrote: /home/junhuawa/rpmbuild/RPMS/x86_64/python-perf-3.10.0-327.el7.x86_64.rpm
     Wrote: /home/junhuawa/rpmbuild/RPMS/x86_64/kernel-tools-3.10.0-327.el7.x86_64.rpm
     Wrote: /home/junhuawa/rpmbuild/RPMS/x86_64/kernel-tools-libs-3.10.0-327.el7.x86_64.rpm
     Wrote: /home/junhuawa/rpmbuild/RPMS/x86_64/kernel-tools-libs-devel-3.10.0-327.el7.x86_64.rpm
     Wrote: /home/junhuawa/rpmbuild/RPMS/x86_64/kernel-devel-3.10.0-327.el7.x86_64.rpm
     Executing(%clean): /bin/sh -e /var/tmp/rpm-tmp.yZXPXY
     + umask 022
     + cd /home/junhuawa/rpmbuild/BUILD
     + cd kernel-3.10.0-327.el7
     + rm -rf /home/junhuawa/rpmbuild/BUILDROOT/kernel-3.10.0-327.el7.x86_64
     + exit 0
