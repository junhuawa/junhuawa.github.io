---
layout: post
title: "WindRiver BSP Layer and Template"
date: 2015-10-10
category: "bsp" 
tags: [bsp]
---

Layers provide templates and packages, while templates provide configuration. For
example, a new package becomes available to the build system when you add it to
a layer, but it only becomes part of a given project when you configure in the
template that selects it. The template does not contain the package, it merely marks
the package for inclusion.

1. Configure layers—the list of layers you optionally provide to the configure
command with the --with-layer argument. You may specify one or more layers
by separating them with commas. The first layers you list are the highest
priority, for example:

--with-layer=/path/toplayer,/path/middlelayer,/path/bottomlayer

### Basic Layer Contents

Layers contain various configuration and source directories as well as directories
containing pre-built packages that are recognized by the build system.
Configuration and Source Directories

    templates/—Configuration templates.
    dist/—Makefiles and patches for tools and packages.
    tools/—Host tool source packages.
    packages/—Target packages.
    Pre-Built Directories
    host-tools/—Pre-built host tools, mirrored into projectDir/host-cross/.
    boards/—Pre-built kernels, mirrored into projectDir/export/.
    RPMS/—

Included templates are processed before including templates.

### BSP location

    installDir/wrlinux-4/layers/bsps/


A BSP layer is a subdirectory of the templates/board directory, files 
include files: specify additional templates to include. indicates a CPU arch --> determine compiler toolchain.
Config file: config.sh specify config info ( host arch, compiler flags, and supported kernel or root file system type).
Kernel config fragments: it's name should like name.cfg, and explicitly  list them for sourcing in an SCC file.

Patches:

    Package list: pkglist.add
    Additional files: for examples bootloader
    Root file system components
    Readme file:


### Creating the Top-level include File:

     It must define the type of CPU used on the board, and the kernel architecture used by the kernel.
     A typical include file looks like this:
     cpu/ppc_e500
     karch/powerpc

The supported CPU templates can be found in the following directory:

    installDir/wrlinux-4/layers/wrll-toolchain-version/arch/templates/cpu.

The supported kernel architecture templates are found in the following directory:

    installDir/wrlinux-4/layers/wrll-linux-version/templates/ karch


Config.sh

     TARGET_BOARD: BSP name
     TARGET_LINUX_LINKS: The name of the kernel image - vmlinux/bzImage
     TARGET_SUPPORTED_COMBS: The list of supported kernel and root file system template combinations allowed.
     
scc_leaf:
     You use the scc_leaf command to indicate to the kernel build system that you are a leaf node.  
BSPs, and in general things you want to compile, are leaf nodes on the git tree.
This information is required for any BSP that is not shipped with Wind River Linux. 
It is used during the build to locate a suitable target to process for a given BSP.

scc_leaf ktypes/standard commodore_64-standard

The scc_leaf command creates a leaf node on top of branch branch called
bsp-kerneltype. In the example, the command creates a leaf node on top of the
branch ktypes/standard called commodore_64-standard . The naming convention
bsp-kerneltype is required to be properly interpreted by the build system.

### BSPname.cfg

     a kernel configuration fragment.

Note that the way to turn a flag off is with a comment asserting that the configuration flag is not set, as follows:

# CONFIG_USB_GADGET is not set

This actually clears any previous value the flag has, rather than merely having no effect. 
If you simply don’t want to affect a value, don’t mention it at all in your kernel configuration fragment.

### nsn_cpvc-standard.scc:

    scc_leaf bsp/intel_xeon_c600_pch/intel_xeon_c600_pch-standard nsn_cpvc-standard
    kconf hardware nsn_cpvc.cfg


### make linux.config

    Create the final .config file in projectDir/build/linux-bspName-kernelType-build/ directory.

### Regenerate the kernel configuration

    make linux.reconfig


### File system templates:

     wrll-userspace/templates/rootfs/
