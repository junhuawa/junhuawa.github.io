---
layout: post
title: "Loading modules from file descriptors"
category: "module loading"
tags: [LWN]
---
[Loading modules from file descriptors](https://lwn.net/Articles/519010/)

动态加载内核模块给我们提供了很多好处:

    加载内核模块不需要系统重启; 意味着增加内核功能不会影响到用户和应用。
    从开发者来说，通过module实现内核功能比通过编译内核，重启，测试来增加内核功能更快！
    用内核模块同样可以节省内存，因为模块代码占用的内存只有当实际需要模块的时候才被占用。因此device driver经常通过可加载模块来实现。

从安全角度来说，可加载模块有一个缺陷：因为一个模块对内核内存有充分的访问权限，它将导致系统一致性的妥协！
尽管模块只能通过特权用户加载，但是还是有潜在的安全风险，因为系统管理员可能不能直接验证特定内核模块的可靠性和来源。目前正在做提供模块相关的架构支持管理者的努力，最著名的当数module signing.

Kees Cook 最近提交了一系列patch，用于解决另一种模块验证问题; 这些patch为加载内核模块增加了一个system call. 
已经存在的加载内核模块的接口如下:

    int init_module(void *module_image, unsigned long len,
                        const char *param_values);

该接口支持通过一个内存缓冲区(memory buffer pointed to by module_image)来加载内核，该接口主要用户是insmod and modprobe command, 但是任何特权用户空间应用(with CAP_SYS_MODULE capability) 可以用同样的方式加载内核模块，通过一下三步:

        Open ELF image
        reading or mmap()ing the file's contents into memory,
        Calling init_module().

这里存在一个风险，因为获取fd和模块加载是分开的，OS丢失了通过模块在文件系统的位置来判断是否安全的能力。 Kees说:
    当一个OS已经信任一个具体的文件系统，文件等的时候(比如安全labels，or an existing root of trust to a partition)，通过内核模块的源来判断是否安全是有价值的。

Kees的方案比较直接: 删除以上3步，相反，应用打开一个文件，将fd传给内核，作为a new module-loading system call 的一部分，kernel然后从fd读the module image。

Kees给Google的Chrome OS工作，他例举了增加这个system call的动机，具体的说，为了确保
用户系统的一致性，Chrome OS 开发者想要能够在系统上加上限制，即只能通过系统的read-only, cryptographically verified root filesystem来加载内核模块。因为开发者已经信任这个root filesystem的内容，再用module signatrues的方法来验证内核模块的内容将增加不必要的keys，并且降低模块加载速度。 Chrome OS需要的是一个light-weight mechanism， 来验证模块image来自于文件系统，而新的系统调用刚好提供了这个功能。

    int finit_module(int fd, const char __user *uargs, int flags);

