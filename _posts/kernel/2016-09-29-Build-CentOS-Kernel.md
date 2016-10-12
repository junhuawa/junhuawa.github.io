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


     [junhuawa@Tesla rpmbuild]$ rpm -ql rpm-build-4.11.3-17.el7.x86_64 |grep rpmbuild
     /usr/bin/rpmbuild
     /usr/share/man/man8/rpmbuild.8.gz

How to build a RPM package from the source code

The SPEC file typically contains instructions on how to build RPM, what files are part of package and where it should be installed.

The rpmbuild performs the following tasks during the build process.

    Executes the commands and macros mentioned in the prep section of the spec file.
    Checks the content of the file list
    Executes the commands and macros in the build section of the spec file. Macros from the file list is also executed at this step.
    Creates the binary package file
    Creates the source package file


The spec file usually consists of the following eight different sections:

    Preamble – The preamble section contains information about the package being built and define any dependencies to the package. 
In general, the preamble consists of entries, one per line, that start with a tag followed by a colon, and then some information.
    %prep – In this section, we prepare the software for building process. 
Any previous builds are removed during this process and the source file(.tar) file is expanded, etc.
    One more key thing is to understand there are pre-defined macros available to perform various shortcut options to build rpm. 
You may be using this macros when you try to build any complex packages. 
In the below example, I have used a macro called %setup which removes any previous builds, 
untar the source files and changes the ownership of the files. 
You can also use sh scripts under %prep section to perform this action but %setup macro simplifies the process by using predefined sh scripts.
    %description – the description section usually contains description about the package.
    %build – This is the section that is responsible for performing the build. Usually the %build section is an sh script.
    %install – the % install section is also executed as sh script just like %prep and %build. This is the step that is used for the installation.
    %files – This section contains the list of files that are part of the package. 
If the files are not part of the %files section then it wont be available in the package. 
Complete paths are required and you can set the attributes and ownership of the files in this section.
    %clean – This section instructs the RPM to clean up any files that are not part of the application’s normal build area. 
Lets say for an example, If the application creates a temporary directory structure in /tmp/ as part of its build, it will not be removed. 
By adding a sh script in %clean section, the directory can be removed after the build process is completed.

