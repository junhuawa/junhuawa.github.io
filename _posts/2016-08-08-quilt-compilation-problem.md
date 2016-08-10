---
layout: post
title: "quilt compilation problem"
category: "demo"
tags: [quilt]
---

quilt is a tool used for patch/unpatch. When I build a new project from another department, compilation report error because the codes haven't be patched sussessfully.

###### Problem Description:
[junhuawa@Tesla]$make all  
cp cortina_3.6.6/cs4321_api.c .  
cp cortina_3.6.6/cs4321_api.h .  
cp cortina_3.6.6/cs_rtos.c    .  
cp cortina_3.6.6/cs_rtos.h    .  
cp cortina_3.6.6/cs_types.h   .  
/build/home/SC_LFS/sdk/tags/PS_LFS_SDK_3_28/bld-tools/i686-pc-linux-gnu/bin/quilt push -a   # apply patches to get to newest version plus our own changes  
No series file found  
make: *** [cs4321_api.c] Error 2  
[junhuawa@Tesla]$  

[junhuawa@hzling40]$/var/fpwork1/junhuawa/LRC/bld/sdk3/bld-tools/x86_64-pc-linux-gnu/bin/mips64-octeon2-linux-gnu-gcc -O2 -Wall  -fdata-sections -ffunction-sections -DAPI_VERSION=366   -c -o io.o io.c  
In file included from cs_rtos.h:31:0,  
from cs4321_api.h:11,  
    from io.c:24:  
    cs_types.h:28:23: fatal error: cs_config.h: No such file or directory  
compilation terminated.  
[junhuawa@hzling40]$  

###### Solution:
Finnaly, find the root cause is that:  
There is a .quiltrc file in my home directory, the variables in the file override the default value of the quilt.  
Default locations of patches is in the patches sub-directory, the QUILT_PATCHES variable override it's value to wrlinux_quilt_patches, that's the root cause.  

[junhuawa@hzling40]$pwd  
/var/fpwork1/junhuawa  
[junhuawa@hzling40]$cat ~/quiltrc   
**export QUILT_PATCHES=wrlinux_quilt_patches**   
export QUILT_PC=.pc  
export WRLINUX_USE_QUILT=yes  
export PATH=$PATH:/var/fpwork/junhuawa/trunk/distro_build/host-cross/bin  
[junhuawa@hzling40]$  


Remove the ~/.quiltrc, or change the QUILT_PATCHES to patches in the ~/.quiltrc, solve the problem.  
**export QUILT_PATCHES=patches**  

###### Quilt cmds:
[junhuawa@Tesla]$quilt push -a // apply all patches defined in the patches/series.  
Applying patch cortina_3.6.6/P001_add_image_len_and_endianess  
patching file cs4321_api.c  
patching file cs4321_api.h  
patching file cs_types.h  

[junhuawa@Tesla]$quilt pop -a //remove all the applied patches.  
Removing patch cortina_3.6.6/P007_wait_for_an_regdump_off  
Restoring cs_rtos.c  
Restoring cs4321_api.c  
Restoring cs_rtos.h  

###### Attention:  
Before quilt push/pop cmd work, there must have environment variable QUILD_DIR.In the directory, all the sub commands are located.  
[junhuawa@hzling40]$env |grep QUILT  
**QUILT_DIR=/build/home/SC_LFS/sdk/tags/PS_LFS_SDK_3_28/bld-tools/i686-pc-linux-gnu/share/quilt/**  
[junhuawa@hzling40]$ls /build/home/SC_LFS/sdk/tags/PS_LFS_SDK_3_28/bld-tools/i686-pc-linux-gnu/share/quilt/  
add       applied  delete  edit   fold  graph  header  mail  next     pop       push     remove  revert   series  snapshot  unapplied  
annotate  compat   diff    files  fork  grep   import  new   patches  previous  refresh  rename  scripts  setup   top       upgrade  


###### quilt man page:  
*http://linux.die.net/man/1/quilt*
