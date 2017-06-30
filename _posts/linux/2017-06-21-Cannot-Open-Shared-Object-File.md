---
layout: post
title: "cannot open shared object file: No such file or directory"
date: 2017-06-21
category: "linux" 
tags: [misc]
---

We need to load a iperf3 binary to the target device for performance testing.
We copy it to the /tmp/ directory, and run it, it report below error, can't
find the corresponding lib.

    root@lrc-lsp-axm-0:/tmp/usr/bin# ./iperf3
    ./iperf3: error while loading shared libraries: libiperf.so.0: cannot open shared object file: No such file or directory

But actually, the lib already loaded in the dir: /tmp/usr/lib/

    root@lrc-lsp-axm-0:/tmp/usr/bin# ls /tmp/usr/lib/ -l
    lrwxrwxrwx    1 root root            17 Jan 20 04:11 libiperf.so.0 -> libiperf.so.0.0.0
    -rwxr-xr-x    1 root root         72868 Jul  8  2015 libiperf.so.0.0.0
    root@lrc-lsp-axm-0:/tmp/usr/bin# 

So, we need to add the tmp directory to the `LD_LIBRARY_PATH`.

    export export LD_LIBRARY_PATH=/tmp/usr/lib/

Then, execute below command `ldconfig`:

    root@lrc-lsp-axm-0:/tmp/usr/bin# ldconfig

Then issue iperf3 cmd, it works.

    root@lrc-lsp-axm-0:/tmp/usr/bin# /tmp/usr/bin/iperf3
    iperf3: parameter error - must either be a client (-c) or server (-s)

    Usage: iperf [-s|-c host] [options]
        iperf [-h|--help] [-v|--version]

    Server or Client:
    -p, --port      #         server port to listen on/connect to

