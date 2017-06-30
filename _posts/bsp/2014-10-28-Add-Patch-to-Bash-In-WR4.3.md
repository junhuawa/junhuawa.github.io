---
layout: post
title: "Add Patch to Bash In WR4.3"
date: 2014-10-28
category: "bsp"
tags: [bsp]
---

Bash src.rpm package (bash-3.2-30.fc10.src.rpm) is from the WR, new patches are got from WR website by Matti. 
The patches are added to directory: /linux_builds/dxscm/WR_Kernel/wrl-403.010/WR/wrlinux-4/layers/wrll-userspace/core/dist in default, 
but we don't have the permission because it's maintained by SCM team, 
so we need to add the patch to our Test layer.

bash-3.2-30.fc10.src.rpm is from dir: 

    /linux_builds/dxscm/WR_Kernel/wrl-403.010/WR/wrlinux-4/layers/wrll-userspace/core/packages

### Steps:

1) In the /wrll-userspace/core/dist directory, use patch cmd to create the final patches.

    [junhuawa@Tesla]$pwd
    /linux_builds/dxscm/WR_Kernel/wrl-403.010/WR/wrlinux-4/layers/wrll-userspace/core/dist
    [junhuawa@Tesla]$tree bash/
    bash/
    |-- Makefile
    |-- Makefile.var
    |-- bash.spec
    `-- patches
        |-- bash-cross.diff
        |-- bash-fix-CVE-2008-5374.patch
        |-- bash-fix-readfile-error-handle.patch
        |-- bash-progname-bug-fix.diff
        |-- dynamic-siglist.diff
        `-- etc_bashrc

    1 directory, 9 files

$cd /product/wrlinux-4/layers/updates/RCPL-4.3-WRL.0026/wrll-userspace
$patch -p1 < 0001-bash-CVE-2014-6271-remote-code-execution-through-bas-4.3.patch
$patch -p1 < 0002-bash-CVE-2014-7169-and-an-Out-of-bounds-issue-4.3.patch
$patch -p1 < 0003-bash-CVE-2014-6277-and-CVE-2014-6278-mitigation-4.3.patch
$patch -p1 < 0004-bash-CVE-issue-on-shellshock-4.3.patch
----
0001-bash-CVE-2014-6271-remote-code-execution-through-bas-4.3.patch
patching file core/dist/bash/patches/funcdef-import-3.2.patch
----
0002-bash-CVE-2014-7169-and-an-Out-of-bounds-issue-4.3.patch
patching file core/dist/bash/patches/eol-pushback.patch
patching file core/dist/bash/patches/parser-oob-3.2.patch
----
0003-bash-CVE-2014-6277-and-CVE-2014-6278-mitigation-4.3.patch
patching file core/dist/bash/patches/func-import-export.patch // already have this patch
---------
0004-bash-CVE-issue-on-shellshock-4.3.patch
patching file core/dist/bash/patches/bash32-053
patching file core/dist/bash/patches/bash32-054
patching file core/dist/bash/patches/bash32-055
patching file core/dist/bash/patches/bash32-056
patching file core/dist/bash/patches/bash32-057
patching file core/dist/bash/patches/eol-pushback.patch
patching file core/dist/bash/patches/func-import-export.patch
patching file core/dist/bash/patches/parser-oob-3.2.patch

//patch 0002-0003 will add patch func-import-export.patch, eol-pushback.patch, parser-oob-3.2.patch
but in patch 0004, it will remove the patches and replace it with new ones. So, don't need to patch 0002, 0003 actually.

#### Only need to patch:

    funcdef-import-3.2.patch
    bash32-053
    bash32-054
    bash32-055
    bash32-056
    bash32-057

Copy the new patches to another directory patches, and it's ready for below patch;

2) build the WR4.3 CPVC BSP, by build_cpvc_wr43.sh -es;

3) Enter build directory, make bash.quilt to let WR4.3 track the changes made by patch;

make bash.quilt

4) Enter bash-3.2/BUILD/bash-3.2/ directory, patch the patches by hand;
Before do real patch, we can use --dry-run to test if patch can by done successfully.

    patch --dry-run -p1 -i ../../../../patches/funcdef-import-3.2.patch
         - patch -p1 -i ../../../../patches/funcdef-import-3.2.patch or
              patch -p1 <  ../../../../patches/funcdef-import-3.2.patch
         - patch -p0 -i ../../../../patches/bash32-053
         - patch -p0 -i ../../../../patches/bash32-054
         - patch -p0 -i ../../../../patches/bash32-055
         - patch -p0 -i ../../../../patches/bash32-056
         - patch -p0 -i ../../../../patches/bash32-057

5) After done patch, use quilt diff to check if the changes by patch can be tracked correctly.

     ../../host-cross/bin/quilt diff

6) Use quilt refresh can create the final patches we will use in the Test layer.

     ../../host-cross/bin/quilt refresh

7) Then, use exportPatches.tcl to create the custom layer in the Test directory

    export QUILT_PATCHES=wrlinux_quilt_patches
    export QUILT_PC=.pc
    export USE_QUILT=yes
    alias exportpatches=/linux_builds/dxscm/WR_Kernel/wrl-403.010/WR/wrlinux-4/scripts/exportPatches.tcl

    $ installDir/wrlinux-4/scripts/exportPatches.tcl \
    EXPORT_PATCH_PATCH=path_to_patch \
    EXPORT_PATCH_LAYER=path_to_layer \
    EXPORT_PATCH_DESCR=”text”

    exportpatches -f EXPORT_PATCH_PATCH=/home/junhuawa/trunk/distro_build/work_cpvc/build/bash-3.2/wrlinux_quilt_patches/2014-10-27_07-11-50-bash.patch EXPORT_PATCH_LAYER=/home/junhuawa/trunk/layer/WR4.3/Test/ EXPORT_PATCH_DESCR="PR 46209ESPE06: ShellShock patch update for Linux bash shell binary"

It will create a directory in /home/junhuawa/trunk/layer/WR4.3/Test/

8) Because we found the patch create by quilt don't have all the changes we done to the src code, so we not use the patch finally, 
we add the raw patches to the layer directly.

    [junhuawa@Tesla]$pwd
    /home/junhuawa/trunk/layer/WR4.3/Test
    [junhuawa@Tesla]$tree dist/
    dist/
    |-- bash
    |   |-- Makefile
    |   |-- Makefile.var
    |   |-- bash.spec
    |   `-- patches
    |       |-- bash-cross.diff
    |       |-- bash-fix-CVE-2008-5374.patch
    |       |-- bash-fix-readfile-error-handle.patch
    |       |-- bash-progname-bug-fix.diff
    |       |-- bash32-053
    |       |-- bash32-054
    |       |-- bash32-055
    |       |-- bash32-056
    |       |-- bash32-057
    |       |-- dynamic-siglist.diff
    |       |-- etc_bashrc
    |       |-- funcdef-import-3.2.patch
    |       `-- rpm_patches.list

Need to modify bash.spec, rpm_patches.list to add new patches to the files.

9) Remove the .svn directory in bash, patches directory, because it have old .svn dir which copyed by the exportPatches.tcl tools.

10) Use svn add, svn ci to add the new directory files to the svn trunk.

11) If this is a new feature like mcelog, we need to add directory in the templates/feature/ directory:

    [junhuawa@Tesla]$tree  templates/feature/bash/
    templates/feature/bash/
    `-- pkglist.add

    0 directories, 1 file
    [junhuawa@Tesla]$cat templates/feature/bash/pkglist.add
    bash

    [junhuawa@Tesla]$

### Reference 

    wr_linux_users_guide_4.3.pdf Chapter 7.

12) Clear the src code and redownload the src code again, and compile:

          make bash.distclean
          make bash.srpm_clean
          make bash

### Another way is to add the patch to the WR SDK directly!
