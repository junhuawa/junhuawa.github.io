---
layout: post
title: "Timer Overflow(Resouce not availabe)"
date: 2014-10-20
category: "case" 
tags: [Timer]
---

7 prontoes are reported for the problem on Application and customer side.
------------------------------------------
PR NA05532776: Cannot run QRS on IPDU-3 at SEMME000

PR NA05526290: NS3.0 PILOT IPDU Interface Status Error

PR 80174ESPE03: ZQRS COMMAND EXECUTION FAILED for IPDU3


### Main problem: 

From the log, we found the posix timer resources is run out of. lnx-rsterm, lnx-ipconf-d, lnx-log-sender-d report timer_create error.

1) We try to enable the timer_stats feature in the kernel, so it will report the timer resource info for every process;

Encounter problem: load the new kernel to NE, report OOPS when insmod the igb.ko;

Finally root cause: The NE use kernel version 3.101-0, we build the kernel with version 3.107-0. because enable the kernel
   feature, it will change the structure size of net_device. It cause the oops when use the old igb.ko.

2) Use new LN071C04.IMG(file system with new igb.ko), it report another OOPS when startup lnx-dmxmsg-epo-d. Because the new kernel
is imcompatible with the old dmxmsg, recompile the LinDX project based on the new hack64gcc. 

3) timer_stats feature works, but it doesn't provide what we want.

a. /proc/pid/status 

0075-$ cat 445/status 

    Name:   lnx-ipd
    State:  S (sleeping)
    Tgid:   445
    Pid:    445
    PPid:   136
    TracerPid:      0
    Uid:    0       0       0       0
    Gid:    0       0       0       0
    FDSize: 64
    Groups:
    VmPeak:   245528 kB
    VmSize:   183248 kB
    VmLck:         0 kB
    VmHWM:      9096 kB
    VmRSS:      9096 kB
    VmData:    98860 kB
    VmStk:      3152 kB
    VmExe:       660 kB
    VmLib:      3576 kB
    VmPTE:       164 kB
    VmSwap:        0 kB
    Threads:        5
    SigQ:   48/30034
    SigPnd: 0000000000000000
    ShdPnd: 0000000000000000
    SigBlk: 0000000000000000
    SigIgn: 0000000000000000
    SigCgt: 000000018001cea7
    CapInh: 0000000000000000
    CapPrm: ffffffffffffffff
    CapEff: ffffffffffffffff
    CapBnd: ffffffffffffffff
    Cpus_allowed:   fff
    Cpus_allowed_list:      0-11
    Mems_allowed:   1
    Mems_allowed_list:      0
    voluntary_ctxt_switches:        38
    nonvoluntary_ctxt_switches:     6

SigQ:   48/30034 

    #48 is the timer count used by all the process in the system, not for the specified process
	#30034 the timer resource availabe for the process, if not set, it will be the resource of the whole OS.



	b. 0040-$ cat /proc/timer_stats

event count | pid(thread?) | process name | function(callback function) 
only can record 1024 records(timer).

    Timer Stats Version: v0.2
    Sample period: 18428.940 s
    Overflow: 114022 entries
     471544,     0 swapper          hrtimer_start_range_ns (tick_sched_timer)
     308415,     0 swapper          hrtimer_start_range_ns (tick_sched_timer)
     379363,     0 swapper          hrtimer_start_range_ns (tick_sched_timer)
     548074,     0 swapper          hrtimer_start_range_ns (tick_sched_timer)
     489339,     0 swapper          hrtimer_start_range_ns (tick_sched_timer)
     854284,     0 swapper          hrtimer_start_range_ns (tick_sched_timer)
     1589424,     0 swapper          hrtimer_start (tick_sched_timer)
     1842859,     0 swapper          add_timer (smi_timeout)
     3804,     1 swapper          __enqueue_rt_entity (sched_rt_period_timer)
     906236,     0 swapper          hrtimer_start_range_ns (tick_sched_timer)
     698549,     0 swapper          hrtimer_start_range_ns (tick_sched_timer)
     30878,     0 swapper          hrtimer_start (tick_sched_timer)
        4,   184 modprobe         schedule_timeout_uninterruptible (process_timeout)
        8,   184 modprobe         schedule_timeout_uninterruptible (process_timeout)
        4,   184 modprobe         schedule_timeout_uninterruptible (process_timeout)
        2,   184 modprobe         schedule_timeout_uninterruptible (process_timeout)
     184288,     0 swapper          ipmi_timeout (ipmi_timeout)
       22,   184 modprobe         schedule_timeout_uninterruptible (process_timeout)
        2,   184 modprobe         schedule_timeout_uninterruptible (process_timeout)
        2,   185 modprobe         schedule_timeout_uninterruptible (process_timeout)
     8519,     0 swapper          hrtimer_start (tick_sched_timer)
        2,   185 modprobe         schedule_timeout_uninterruptible (process_timeout)
     36857,     0 swapper          clocksource_watchdog (clocksource_watchdog)
       11,   215 ifconfig         schedule_timeout_uninterruptible (process_timeout)
        1,   215 ifconfig         schedule_timeout_uninterruptible (process_timeout)
       11,   217 ifconfig         schedule_timeout_uninterruptible (process_timeout)
        1,   217 ifconfig         schedule_timeout_uninterruptible (process_timeout)
        8,     1 init             hrtimer_start_range_ns (hrtimer_wakeup)
        1,   165 sleep            hrtimer_start_range_ns (hrtimer_wakeup)
     7969,     0 swapper          hrtimer_start (tick_sched_timer)
        2,   184 modprobe         queue_delayed_work (delayed_work_timer_fn)
     74365,     0 swapper          hrtimer_start (tick_sched_timer)
     2536,   163 lnx-launcher-d   hrtimer_start_range_ns (hrtimer_wakeup)
    18428D,    30 events/3         queue_delayed_work (delayed_work_timer_fn)
        1,   220 sleep            hrtimer_start_range_ns (hrtimer_wakeup)
    14717D,    29 events/2         queue_delayed_work (delayed_work_timer_fn)
    13374D,    33 events/6         queue_delayed_work (delayed_work_timer_fn)
    18427D,    27 events/0         queue_delayed_work (delayed_work_timer_fn)
    14960D,    31 events/4         queue_delayed_work (delayed_work_timer_fn)
     3414,     0 swapper          hrtimer_start (tick_sched_timer)
    15512D,    28 events/1         queue_delayed_work (delayed_work_timer_fn)
     5219,     0 swapper          hrtimer_start (tick_sched_timer)
     8118,     0 swapper          hrtimer_start (tick_sched_timer)
    12168D,    32 events/5         queue_delayed_work (delayed_work_timer_fn)
     9214,    33 events/6         igb_watchdog_task (igb_watchdog)
     9214,    33 events/6         igb_watchdog_task (igb_watchdog)
        1,   222 sleep            hrtimer_start_range_ns (hrtimer_wakeup)
    13061D,    34 events/7         queue_delayed_work (delayed_work_timer_fn)
        2,    27 events/0         mld_ifc_start_timer (mld_ifc_timer_expire)
        2,    27 events/0         mld_ifc_start_timer (mld_ifc_timer_expire)
        1,    27 events/0         add_timer (addrconf_dad_timer)
        1,    27 events/0         add_timer (addrconf_dad_timer)
        1,   224 sleep            hrtimer_start_range_ns (hrtimer_wakeup)
        1,     0 swapper          add_timer (addrconf_dad_timer)
        1,     0 swapper          add_timer (addrconf_dad_timer)
        1,   226 sleep            hrtimer_start_range_ns (hrtimer_wakeup)
        1,    27 events/0         igb_watchdog_task (igb_update_phy_info)
        1,    27 events/0         igb_watchdog_task (igb_update_phy_info)
        2,   201 lnx-dmxmsg-epo-  hrtimer_start_range_ns (hrtimer_wakeup)
        1,   228 sleep            hrtimer_start_range_ns (hrtimer_wakeup)
        1,   236 insmod           timer_register_to_sym (timer_register_to_sym)
     60746,     0 swapper          timer_send_refresh (timer_send_refresh)
        1,   238 sleep            hrtimer_start_range_ns (hrtimer_wakeup)
     3685,    39 bdi-default      bdi_forker_task (process_timeout)
     17664,   244 lnx-fu-fuzzi-d   hrtimer_start_range_ns (hrtimer_wakeup)
        1,   254 sleep            hrtimer_start_range_ns (hrtimer_wakeup)
     14917,   257 lnx-fu-rcy-d     hrtimer_start_range_ns (hrtimer_wakeup)
        3,     0 swapper          add_timer (addrconf_rs_timer)
     3071,     0 swapper          arm_supers_timer (sync_supers_timer_fn)
     3685,    27 events/0         __netdev_watchdog_up (dev_watchdog)
     3685,    27 events/0         __netdev_watchdog_up (dev_watchdog)
        2,     0 swapper          add_timer (addrconf_rs_timer)
     9116,   163 lnx-launcher-d   hrtimer_start_range_ns (posix_timer_fn)
        1,   259 sleep            hrtimer_start_range_ns (hrtimer_wakeup)
        1,   261 sleep            hrtimer_start_range_ns (hrtimer_wakeup)
       12,   252 lnx-unabom-d     timer_send_refresh (timer_send_refresh)
       ......
        2,  7055 ssh              sk_reset_timer (tcp_delack_timer)
        1,  7022 sshd             sk_reset_timer (tcp_write_timer)
        1,  7021 ssh              sk_reset_timer (tcp_write_timer)
        2,  7073 sshd             sk_reset_timer (tcp_delack_timer)
        2,  7072 ssh              sk_reset_timer (tcp_delack_timer)
        1,  7039 sshd             sk_reset_timer (tcp_write_timer)
        1,  7038 ssh              sk_reset_timer (tcp_write_timer)
        2,  7090 sshd             sk_reset_timer (tcp_delack_timer)
        2,  7089 ssh              sk_reset_timer (tcp_delack_timer)
        1,  7056 sshd             sk_reset_timer (tcp_write_timer)
        1,  7055 ssh              sk_reset_timer (tcp_write_timer)
        2,  7107 sshd             sk_reset_timer (tcp_delack_timer)
       ......
        1,  8449 lnx-mmeDiaLBSHa  hrtimer_start_range_ns (posix_timer_fn)
        1,  8491 lnx-mmeDiaLBSHa  hrtimer_start_range_ns (hrtimer_wakeup)
        4,  8493 lnx-mmeDiaLBSHa  add_timer (sctp_generate_t1_init_event)
        1,  8453 lnx-mmeDiaLBSHa  hrtimer_start_range_ns (posix_timer_fn)
        1,  7598 lnx-mmeGTPLBS    neigh_add_timer (neigh_timer_handler)
        1,  8493 lnx-mmeDiaLBSHa  hrtimer_start_range_ns (hrtimer_wakeup)
        4,  8500 lnx-mmeDiaLBSHa  add_timer (sctp_generate_t1_init_event)
        1,  8457 lnx-mmeDiaLBSHa  hrtimer_start_range_ns (posix_timer_fn)
        1,  8458 lnx-mmeDiaLBSHa  hrtimer_start_range_ns (posix_timer_fn)
        1,  8459 lnx-mmeDiaLBSHa  hrtimer_start_range_ns (posix_timer_fn)
        1,  8460 lnx-mmeDiaLBSHa  hrtimer_start_range_ns (posix_timer_fn)
        1,  8500 lnx-mmeDiaLBSHa  hrtimer_start_range_ns (hrtimer_wakeup)
        4,  8504 lnx-mmeDiaLBSHa  add_timer (sctp_generate_t1_init_event)
        1,  8464 lnx-mmeDiaLBSHa  hrtimer_start_range_ns (posix_timer_fn)
        1,  8465 lnx-mmeDiaLBSHa  hrtimer_start_range_ns (posix_timer_fn)
        1,  8504 lnx-mmeDiaLBSHa  hrtimer_start_range_ns (hrtimer_wakeup)
        4,  8508 lnx-mmeDiaLBSHa  add_timer (sctp_generate_t1_init_event)
        1,  8466 lnx-mmeDiaLBSHa  hrtimer_start_range_ns (posix_timer_fn)
        1,  8470 lnx-mmeDiaLBSHa  hrtimer_start_range_ns (posix_timer_fn)
        1,  8508 lnx-mmeDiaLBSHa  hrtimer_start_range_ns (hrtimer_wakeup)
        4,  8512 lnx-mmeDiaLBSHa  add_timer (sctp_generate_t1_init_event)
        1,  8471 lnx-mmeDiaLBSHa  hrtimer_start_range_ns (posix_timer_fn)
        1,  8472 lnx-mmeDiaLBSHa  hrtimer_start_range_ns (posix_timer_fn)
        1,  8473 lnx-mmeDiaLBSHa  hrtimer_start_range_ns (posix_timer_fn)
        1,  8474 lnx-mmeDiaLBSHa  hrtimer_start_range_ns (posix_timer_fn)
        1,  8512 lnx-mmeDiaLBSHa  hrtimer_start_range_ns (hrtimer_wakeup)
        4,  8513 lnx-mmeDiaLBSHa  add_timer (sctp_generate_t1_init_event)
        1,  8479 lnx-mmeDiaLBSHa  hrtimer_start_range_ns (posix_timer_fn)
        1,  8513 lnx-mmeDiaLBSHa  hrtimer_start_range_ns (hrtimer_wakeup)
        4,  8517 lnx-mmeDiaLBSHa  add_timer (sctp_generate_t1_init_event)
        1,  8484 lnx-mmeDiaLBSHa  hrtimer_start_range_ns (posix_timer_fn)
        1,  8483 lnx-mmeDiaLBSHa  hrtimer_start_range_ns (posix_timer_fn)
        1,  8485 lnx-mmeDiaLBSHa  hrtimer_start_range_ns (posix_timer_fn)
        1,  8486 lnx-mmeDiaLBSHa  hrtimer_start_range_ns (posix_timer_fn)
        1,  8487 lnx-mmeDiaLBSHa  hrtimer_start_range_ns (posix_timer_fn)
        1,  8475 lnx-mmeSLsLBS    hrtimer_start_range_ns (posix_timer_fn)
        1,  8517 lnx-mmeDiaLBSHa  hrtimer_start_range_ns (hrtimer_wakeup)
        4,  8524 lnx-mmeDiaLBSHa  add_timer (sctp_generate_t1_init_event)
        1,  8491 lnx-mmeDiaLBSHa  hrtimer_start_range_ns (posix_timer_fn)
        1,  8492 lnx-mmeDiaLBSHa  hrtimer_start_range_ns (posix_timer_fn)
        3,    29 events/2         neigh_add_timer (neigh_timer_handler)
        3,    29 events/2         neigh_add_timer (neigh_timer_handler)
        3,    29 events/2         neigh_add_timer (neigh_timer_handler)
        3,    29 events/2         neigh_add_timer (neigh_timer_handler)
        3,    29 events/2         neigh_add_timer (neigh_timer_handler)
        3,    29 events/2         neigh_add_timer (neigh_timer_handler)
        3,    29 events/2         neigh_add_timer (neigh_timer_handler)
        3,    29 events/2         neigh_add_timer (neigh_timer_handler)
        3,    29 events/2         neigh_add_timer (neigh_timer_handler)
        3,    29 events/2         neigh_add_timer (neigh_timer_handler)
        3,    29 events/2         neigh_add_timer (neigh_timer_handler)
        3,    29 events/2         neigh_add_timer (neigh_timer_handler)
        3,    29 events/2         neigh_add_timer (neigh_timer_handler)
        3,    29 events/2         neigh_add_timer (neigh_timer_handler)
        1,  8524 lnx-mmeDiaLBSHa  hrtimer_start_range_ns (hrtimer_wakeup)
        4,  8529 lnx-mmeDiaLBSHa  add_timer (sctp_generate_t1_init_event)
        1,  8493 lnx-mmeDiaLBSHa  hrtimer_start_range_ns (posix_timer_fn)
        1,  8494 lnx-mmeDiaLBSHa  hrtimer_start_range_ns (posix_timer_fn)
        1,  8495 lnx-mmeDiaLBSHa  hrtimer_start_range_ns (posix_timer_fn)
        1,  8496 lnx-mmeDiaLBSHa  hrtimer_start_range_ns (posix_timer_fn)
        1,  8529 lnx-mmeDiaLBSHa  hrtimer_start_range_ns (hrtimer_wakeup)
        4,  8534 lnx-mmeDiaLBSHa  add_timer (sctp_generate_t1_init_event)
        1,  8500 lnx-mmeDiaLBSHa  hrtimer_start_range_ns (posix_timer_fn)
        1,  8534 lnx-mmeDiaLBSHa  hrtimer_start_range_ns (hrtimer_wakeup)
        4,  8538 lnx-mmeDiaLBSHa  add_timer (sctp_generate_t1_init_event)
        1,  8504 lnx-mmeDiaLBSHa  hrtimer_start_range_ns (posix_timer_fn)
        1,  8538 lnx-mmeDiaLBSHa  hrtimer_start_range_ns (hrtimer_wakeup)
        4,  8543 lnx-mmeDiaLBSHa  add_timer (sctp_generate_t1_init_event)
        1,  8508 lnx-mmeDiaLBSHa  hrtimer_start_range_ns (posix_timer_fn)
        1,  8543 lnx-mmeDiaLBSHa  hrtimer_start_range_ns (hrtimer_wakeup)
        4,  8551 lnx-mmeDiaLBSHa  add_timer (sctp_generate_t1_init_event)
        1,  8512 lnx-mmeDiaLBSHa  hrtimer_start_range_ns (posix_timer_fn)
        1,  8551 lnx-mmeDiaLBSHa  hrtimer_start_range_ns (hrtimer_wakeup)
        4,  8556 lnx-mmeDiaLBSHa  add_timer (sctp_generate_t1_init_event)
        1,  8513 lnx-mmeDiaLBSHa  hrtimer_start_range_ns (posix_timer_fn)
        1,  8556 lnx-mmeDiaLBSHa  hrtimer_start_range_ns (hrtimer_wakeup)
        4,  8560 lnx-mmeDiaLBSHa  add_timer (sctp_generate_t1_init_event)
        1,  8517 lnx-mmeDiaLBSHa  hrtimer_start_range_ns (posix_timer_fn)
        1,  8518 lnx-mmeDiaLBSHa  hrtimer_start_range_ns (posix_timer_fn)
        1,  8519 lnx-mmeDiaLBSHa  hrtimer_start_range_ns (posix_timer_fn)
        1,  8520 lnx-mmeDiaLBSHa  hrtimer_start_range_ns (posix_timer_fn)
        1,  8560 lnx-mmeDiaLBSHa  hrtimer_start_range_ns (hrtimer_wakeup)
        ......
        4,  8640 lnx-mmeDiaLBSHa  add_timer (sctp_generate_t1_init_event)
        1,  8603 lnx-mmeDiaLBSHa  hrtimer_start_range_ns (posix_timer_fn)
    39148591 total events, 2124.299 events/sec

        c. cat /proc/timer_list output the active timer and processes.

        d. cat /proc/pid/limits #can see all the limited resources for every process

0074-$ cat 347/limits 

    Limit                     Soft Limit           Hard Limit           Units     
    Max cpu time              unlimited            unlimited            seconds   
    Max file size             unlimited            unlimited            bytes     
    Max data size             unlimited            unlimited            bytes     
    Max stack size            8388608              unlimited            bytes     
    Max core file size        33554432             33554432             bytes     
    Max resident set          unlimited            unlimited            bytes     
    Max processes             29970                29970                processes 
    Max open files            1024                 1024                 files     
    Max locked memory         65536                65536                bytes     
    Max address space         unlimited            unlimited            bytes     
    Max file locks            unlimited            unlimited            locks     
    Max pending signals       1000                 29970                signals   
    Max msgqueue size         819200               819200               bytes     
    Max nice priority         0                    0                    
    Max realtime priority     0                    0                    
    Max realtime timeout      unlimited            unlimited            us        

0074-$

	e. use ulimit in bash can set the pending signals count
	
Use sh can't set the pending signals by ulimit, need run bash cmd first. 

0074-$ ulimit -a

    core file size          (blocks, -c) 32768
    data seg size           (kbytes, -d) unlimited
    scheduling priority             (-e) 0
    file size               (blocks, -f) unlimited
    pending signals                 (-i) 1000
    ...

0074-$ ulimit -i 10000

0074-$ ulimit -a

    core file size          (blocks, -c) 32768
    data seg size           (kbytes, -d) unlimited
    scheduling priority             (-e) 0
    file size               (blocks, -f) unlimited
    pending signals                 (-i) 10000
    ...

4) Finally, we observe the SigQ value in /proc/pid/status after kill some suspected process(lnx-mmeGTPLBS). And found the application process is a big suspect.

   Before kill: SigQ:	8548/46556 
   After kill:	SigQ:	81/46556

5) Check the code: 

	Timer class: /ns30/SS_LNXmmeComCPPLib/src/cpputil/Timer.cpp

	/dev/shm/junhuawa/ns30/SS_LNXmmeGTPLBS/src/communication/GTPEchoRequestMsgProcessor.cpp

	the timer class have some problem, when they use the timer class in the GTPEchoRequestMsgProcessor.cpp, it usually start the Timer,
	but there is no place to stop the timer which will release the allocated timer. 
	startT3EchoTimer -- no place to stop it. 

```cpp
void GTPEchoRequestMsgProcessor::onTEchoTimerExpired(sigval_t timerParams)
{#it not stop and delete the timer always.
  GTPEchoRequestMsgProcessor *gtpEchoReqMsgProc = reinterpret_cast<GTPEchoRequestMsgProcessor*>(timerParams.sival_pt
  gtpEchoReqMsgProc->setSequenceNumber(0);
  if(LBSLogger::isLogInfoEnabled())
  {
    LBSLogger log(LOG_INF);
    log.setCallerInfo ("GTPLBS", ATERROR, FN);
    log << "onTEchoTimerExpired, resetting sequenceNumber to ZERO and re-initiating EchoRequest message"<<endl;
    log.push();
  }
  gtpEchoReqMsgProc->sendEchoRequestMsgs();
  gtpEchoReqMsgProc->startTEchoTimer();
  gtpEchoReqMsgProc->startT3EchoTimer();
}

void GTPEchoRequestMsgProcessor::onT3EchoTimerExpired(sigval_t timerParams) 
{# it will delete the timer only when retryCount expire.
    if( ( retryCount == -1 ) || ( retryCount == 255 ) )
    {
      if(LBSLogger::isLogDebugEnabled())
      {
        LBSLogger log(LOG_DBG);
        log.setCallerInfo ("GTPLBS", ATERROR, FN);
        log<<"SGW is not found in the map so stop TEcho timer"<<endl;
        log.push();
      }

      gtpEchoReqMsgProc->stopTEchoTimer();

      return;
    }
}
```

-----------------------------------
mkankkon@eskara3a-dhcp-03345 build]$ find linux/ -name *.[ch] -exec grep -H CONFIG_TIMER_STATS {} \;

    linux/kernel/time/timer_list.c:#ifdef CONFIG_TIMER_STATS
    linux/kernel/time/timer_list.c:#ifdef CONFIG_TIMER_STATS
    linux/kernel/hrtimer.c:#ifdef CONFIG_TIMER_STATS
    linux/kernel/hrtimer.c:#ifdef CONFIG_TIMER_STATS
    linux/kernel/hrtimer.c:#ifdef CONFIG_TIMER_STATS
    linux/kernel/hrtimer.c:#ifdef CONFIG_TIMER_STATS
    linux/kernel/timer.c:#ifdef CONFIG_TIMER_STATS
    linux/kernel/timer.c:#ifdef CONFIG_TIMER_STATS
    linux/include/linux/hrtimer.h:#ifdef CONFIG_TIMER_STATS
    linux/include/linux/timer.h:#ifdef CONFIG_TIMER_STATS
    linux/include/linux/timer.h:#ifdef CONFIG_TIMER_STATS

static inline void init_timer_stats(void)  

For GTPLBS: logs can be put on by using cli command in specific unit.

cli setparameter -gtplbs loglevel 6

From the log of /proc/timer_stats, we can see there are many timers are used by lnx-mmeGTPLBS, but it's only used once.
Every row is 1 timer and it's event count. 


# cat /proc/timer_stats 

    Timer Stats Version: v0.2
    Sample period: 251.329 s
     2511,  6638 java             hrtimer_start_range_ns (hrtimer_wakeup)
     3569,     0 swapper          hrtimer_start_range_ns (tick_sched_timer)
     6542,     0 swapper          hrtimer_start_range_ns (tick_sched_timer)
     4181,     0 swapper          hrtimer_start_range_ns (tick_sched_timer)
     3637,     0 swapper          hrtimer_start_range_ns (tick_sched_timer)
     125634,  6658 java             hrtimer_start_range_ns (hrtimer_wakeup)
     125634,  6643 java             hrtimer_start_range_ns (hrtimer_wakeup)
     4604,     0 swapper          hrtimer_start_range_ns (tick_sched_timer)
     125633,  6743 java             hrtimer_start_range_ns (hrtimer_wakeup)
     2526,  6869 lnx-mmeS1LBS     hrtimer_start_range_ns (hrtimer_wakeup)
     2511,  6640 java             hrtimer_start_range_ns (hrtimer_wakeup)
     2512,  6929 lnx-mmeSBcHandl  hrtimer_start_range_ns (hrtimer_wakeup)
      101,  6616 java             hrtimer_start_range_ns (hrtimer_wakeup)
      250,  6618 java             hrtimer_start_range_ns (hrtimer_wakeup)
     176D,    34 events/7         queue_delayed_work (delayed_work_timer_fn)
     5016,  6634 java             hrtimer_start_range_ns (hrtimer_wakeup)
     2512,  6776 lnx-mmeSLsLBS    hrtimer_start_range_ns (hrtimer_wakeup)
     25575,     0 swapper          hrtimer_start (tick_sched_timer)
     25132,     0 swapper          add_timer (smi_timeout)
     5016,  6628 java             hrtimer_start_range_ns (hrtimer_wakeup)
     208D,    33 events/6         queue_delayed_work (delayed_work_timer_fn)
     209D,    32 events/5         queue_delayed_work (delayed_work_timer_fn)
     5018,  6730 java             hrtimer_start_range_ns (hrtimer_wakeup)
     252D,    30 events/3         queue_delayed_work (delayed_work_timer_fn)
     1216,     0 swapper          hrtimer_start (tick_sched_timer)
       42,     0 swapper          arm_supers_timer (sync_supers_timer_fn)
       51,    27 events/0         __netdev_watchdog_up (dev_watchdog)
       51,    27 events/0         __netdev_watchdog_up (dev_watchdog)
       51,    27 events/0         __netdev_watchdog_up (dev_watchdog)
      126,    33 events/6         igb_watchdog_task (igb_watchdog)
      126,    33 events/6         igb_watchdog_task (igb_watchdog)
      126,    33 events/6         igb_watchdog_task (igb_watchdog)
     252D,    27 events/0         queue_delayed_work (delayed_work_timer_fn)
     186D,    28 events/1         queue_delayed_work (delayed_work_timer_fn)
     6567,     0 swapper          hrtimer_start_range_ns (tick_sched_timer)
     5017,  6649 java             hrtimer_start_range_ns (hrtimer_wakeup)
     2510,  6756 lnx-mmeGTPLBS    hrtimer_start_range_ns (hrtimer_wakeup)
     2513,     0 swapper          ipmi_timeout (ipmi_timeout)
      252,  6639 java             hrtimer_start_range_ns (hrtimer_wakeup)
     2511,  6816 lnx-mmeSGsLBS    hrtimer_start_range_ns (hrtimer_wakeup)
     2511,  6904 lnx-mmeDiaLBSHa  hrtimer_start_range_ns (hrtimer_wakeup)
     3195,     0 swapper          hrtimer_start_range_ns (tick_sched_timer)
     196D,    29 events/2         queue_delayed_work (delayed_work_timer_fn)
     2455,     0 swapper          hrtimer_start_range_ns (tick_sched_timer)
     198D,    31 events/4         queue_delayed_work (delayed_work_timer_fn)
      169,     0 swapper          sctp_do_sm (sctp_generate_heartbeat_event)
      833,     0 swapper          timer_send_refresh (timer_send_refresh)
       54,     1 swapper          __enqueue_rt_entity (sched_rt_period_timer)
      503,     0 swapper          clocksource_watchdog (clocksource_watchdog)
       72,   163 lnx-launcher-d   hrtimer_start_range_ns (hrtimer_wakeup)
      243,   244 lnx-fu-fuzzi-d   hrtimer_start_range_ns (hrtimer_wakeup)
      121,  6610 java             hrtimer_start_range_ns (hrtimer_wakeup)
      249,  6617 java             hrtimer_start_range_ns (hrtimer_wakeup)
      341,     0 swapper          hrtimer_start (tick_sched_timer)
      169,  6631 java             sctp_do_sm (sctp_generate_heartbeat_event)
      217,     0 swapper          hrtimer_start (tick_sched_timer)
      126,   523 ifconfig         ixgbe_up_complete (ixgbe_service_timer)
      256,     0 swapper          hrtimer_start (tick_sched_timer)
      204,   257 lnx-fu-rcy-d     hrtimer_start_range_ns (hrtimer_wakeup)
      157,  6631 java             sctp_do_sm (sctp_generate_heartbeat_event)
      121,  6721 java             hrtimer_start_range_ns (hrtimer_wakeup)
      248,  6722 java             hrtimer_start_range_ns (hrtimer_wakeup)
      251,  6948 java             hrtimer_start_range_ns (hrtimer_wakeup)
      126,  6637 java             hrtimer_start_range_ns (hrtimer_wakeup)
      126,    33 events/6         igb_watchdog_task (igb_watchdog)
      126,   419 ifconfig         ixgbe_up_complete (ixgbe_service_timer)
       62,     0 swapper          hrtimer_start (tick_sched_timer)
      124,   163 lnx-launcher-d   hrtimer_start_range_ns (posix_timer_fn)
      168,     0 swapper          sctp_do_sm (sctp_generate_heartbeat_event)
      133,     0 swapper          hrtimer_start (tick_sched_timer)
       50,    34 events/7         __netdev_watchdog_up (dev_watchdog)
       50,    31 events/4         __netdev_watchdog_up (dev_watchdog)
       17,   163 lnx-launcher-d   hrtimer_start_range_ns (posix_timer_fn)
       34,  6680 named            inet_twsk_schedule (inet_twdr_hangman)
       50,   163 lnx-launcher-d   hrtimer_start_range_ns (posix_timer_fn)
       50,   163 lnx-launcher-d   hrtimer_start_range_ns (posix_timer_fn)
       50,   163 lnx-launcher-d   hrtimer_start_range_ns (posix_timer_fn)
       50,   163 lnx-launcher-d   hrtimer_start_range_ns (posix_timer_fn)
       50,   163 lnx-launcher-d   hrtimer_start_range_ns (posix_timer_fn)
       50,   163 lnx-launcher-d   hrtimer_start_range_ns (posix_timer_fn)
       50,   163 lnx-launcher-d   hrtimer_start_range_ns (posix_timer_fn)
       50,   163 lnx-launcher-d   hrtimer_start_range_ns (posix_timer_fn)
       62,   288 lnx-sysmon-d     hrtimer_start_range_ns (hrtimer_wakeup)
       62,   404 lnx-lrm-d        hrtimer_start_range_ns (posix_timer_fn)
       50,    39 bdi-default      bdi_forker_task (process_timeout)
       62,   403 lnx-sysmon-lmp-  hrtimer_start_range_ns (posix_timer_fn)
       50,    27 events/0         __netdev_watchdog_up (dev_watchdog)
        4,     4 ksoftirqd/0      timer_send_refresh (timer_send_refresh)
      17D,    30 events/3         queue_delayed_work (delayed_work_timer_fn)
       25,   323 lnx-log-sender-  hrtimer_start_range_ns (posix_timer_fn)
       25,   385 lnx-blackbox-d   hrtimer_start_range_ns (posix_timer_fn)
       31,   163 lnx-launcher-d   hrtimer_start_range_ns (posix_timer_fn)
       25,   163 lnx-launcher-d   hrtimer_start_range_ns (posix_timer_fn)
       25,   163 lnx-launcher-d   hrtimer_start_range_ns (posix_timer_fn)
       17,   163 lnx-launcher-d   hrtimer_start_range_ns (posix_timer_fn)
        9,   163 lnx-launcher-d   hrtimer_start_range_ns (posix_timer_fn)
        1, 23426 lnx-mmeGTPLBS    hrtimer_start_range_ns (posix_timer_fn)
      17D,    27 events/0         queue_delayed_work (delayed_work_timer_fn)
        1, 23427 lnx-mmeGTPLBS    hrtimer_start_range_ns (posix_timer_fn)
       12,   163 lnx-launcher-d   hrtimer_start_range_ns (posix_timer_fn)
       12,   163 lnx-launcher-d   hrtimer_start_range_ns (posix_timer_fn)
       12,   163 lnx-launcher-d   hrtimer_start_range_ns (posix_timer_fn)
       4D,    30 events/3         queue_delayed_work (delayed_work_timer_fn)
       12,   163 lnx-launcher-d   hrtimer_start_range_ns (posix_timer_fn)
       12,   163 lnx-launcher-d   hrtimer_start_range_ns (posix_timer_fn)
       12,   163 lnx-launcher-d   hrtimer_start_range_ns (posix_timer_fn)
       62,     0 swapper          hrtimer_start (tick_sched_timer)
       12,   163 lnx-launcher-d   hrtimer_start_range_ns (posix_timer_fn)
       12,   163 lnx-launcher-d   hrtimer_start_range_ns (posix_timer_fn)
       12,   163 lnx-launcher-d   hrtimer_start_range_ns (posix_timer_fn)
        6,     0 swapper          neigh_add_timer (neigh_timer_handler)
       12,   163 lnx-launcher-d   hrtimer_start_range_ns (posix_timer_fn)
       12,   163 lnx-launcher-d   hrtimer_start_range_ns (posix_timer_fn)
       12,   163 lnx-launcher-d   hrtimer_start_range_ns (posix_timer_fn)
       12,   163 lnx-launcher-d   hrtimer_start_range_ns (posix_timer_fn)
        8,    30 events/3         queue_delayed_work (delayed_work_timer_fn)
       23,     0 swapper          neigh_add_timer (neigh_timer_handler)
        6,   163 lnx-launcher-d   hrtimer_start_range_ns (posix_timer_fn)
       17,     0 swapper          neigh_add_timer (neigh_timer_handler)
        8,   163 lnx-launcher-d   hrtimer_start_range_ns (posix_timer_fn)
        8,   163 lnx-launcher-d   hrtimer_start_range_ns (posix_timer_fn)
        8,   163 lnx-launcher-d   hrtimer_start_range_ns (posix_timer_fn)
        8,   163 lnx-launcher-d   hrtimer_start_range_ns (posix_timer_fn)
        8,   163 lnx-launcher-d   hrtimer_start_range_ns (posix_timer_fn)
        8,   163 lnx-launcher-d   hrtimer_start_range_ns (posix_timer_fn)
        1, 23440 lnx-mmeGTPLBS    hrtimer_start_range_ns (posix_timer_fn)
        1, 23441 lnx-mmeGTPLBS    hrtimer_start_range_ns (posix_timer_fn)
        1, 23442 lnx-mmeGTPLBS    hrtimer_start_range_ns (posix_timer_fn)
        1, 23443 lnx-mmeGTPLBS    hrtimer_start_range_ns (posix_timer_fn)
        1, 23444 lnx-mmeGTPLBS    hrtimer_start_range_ns (posix_timer_fn)
        1, 23445 lnx-mmeGTPLBS    hrtimer_start_range_ns (posix_timer_fn)
        1, 23446 lnx-mmeGTPLBS    hrtimer_start_range_ns (posix_timer_fn)
        1, 23447 lnx-mmeGTPLBS    hrtimer_start_range_ns (posix_timer_fn)
        1, 23448 lnx-mmeGTPLBS    hrtimer_start_range_ns (posix_timer_fn)
        1, 23449 lnx-mmeGTPLBS    hrtimer_start_range_ns (posix_timer_fn)
        1, 23450 lnx-mmeGTPLBS    hrtimer_start_range_ns (posix_timer_fn)
        1, 23451 lnx-mmeGTPLBS    hrtimer_start_range_ns (posix_timer_fn)
       14,     0 swapper          neigh_add_timer (neigh_timer_handler)
       18,     0 swapper          neigh_add_timer (neigh_timer_handler)
        4,   400 lnx-sysmon-cpup  hrtimer_start_range_ns (hrtimer_wakeup)
        4,   163 lnx-launcher-d   hrtimer_start_range_ns (posix_timer_fn)
        2,  6885 lnx-mmeDiaLBSHa  hrtimer_start_range_ns (posix_timer_fn)
        6,     0 swapper          sctp_do_sm (sctp_generate_sack_event)
        4,  6680 named            sys_epoll_wait (process_timeout)
      110,     0 swapper          queue_delayed_work (delayed_work_timer_fn)
        4,  6805 lnx-mmeSGsLBS    hrtimer_start_range_ns (hrtimer_wakeup)
        2,    69 khungtaskd       schedule_timeout_interruptible (process_timeout)
        2,     0 swapper          add_timer (addrconf_verify)
        2,  6885 lnx-mmeDiaLBSHa  hrtimer_start_range_ns (posix_timer_fn)
        2,     0 swapper          add_timer (peer_check_expire)
        5,   285 lnx-rsterm-d     queue_delayed_work (delayed_work_timer_fn)
        4, 23328 sh               queue_delayed_work (delayed_work_timer_fn)
       1D,     0 swapper          rt_secret_rebuild (rt_secret_rebuild)
        1, 23517 lnx-mmeGTPLBS    hrtimer_start_range_ns (posix_timer_fn)
        1, 23518 lnx-mmeGTPLBS    hrtimer_start_range_ns (posix_timer_fn)
        2,     0 swapper          queue_delayed_work (delayed_work_timer_fn)
        1, 23528 lnx-mmeGTPLBS    hrtimer_start_range_ns (posix_timer_fn)
        1, 23529 lnx-mmeGTPLBS    hrtimer_start_range_ns (posix_timer_fn)
        1, 23530 lnx-mmeGTPLBS    hrtimer_start_range_ns (posix_timer_fn)
        1, 23534 lnx-mmeGTPLBS    hrtimer_start_range_ns (posix_timer_fn)
        1, 23535 lnx-mmeGTPLBS    hrtimer_start_range_ns (posix_timer_fn)
        1, 23536 lnx-mmeGTPLBS    hrtimer_start_range_ns (posix_timer_fn)
        1, 23537 lnx-mmeGTPLBS    hrtimer_start_range_ns (posix_timer_fn)
        1, 23538 lnx-mmeGTPLBS    hrtimer_start_range_ns (posix_timer_fn)
        1, 23539 lnx-mmeGTPLBS    hrtimer_start_range_ns (posix_timer_fn)
        1, 23540 lnx-mmeGTPLBS    hrtimer_start_range_ns (posix_timer_fn)
        1, 23541 lnx-mmeGTPLBS    hrtimer_start_range_ns (posix_timer_fn)
        1, 23542 lnx-mmeGTPLBS    hrtimer_start_range_ns (posix_timer_fn)
        1,  6885 lnx-mmeDiaLBSHa  hrtimer_start_range_ns (posix_timer_fn)
        1,  6885 lnx-mmeDiaLBSHa  hrtimer_start_range_ns (posix_timer_fn)
        1, 23606 lnx-mmeGTPLBS    hrtimer_start_range_ns (posix_timer_fn)
        1, 23607 lnx-mmeGTPLBS    hrtimer_start_range_ns (posix_timer_fn)

The first column is the number of events, the second column the pid, the third
column is the name of the process. The forth column shows the function which
initialized the timer and in parenthesis the callback function which was
executed on expiry.

[Timer stats](https://www.kernel.org/doc/Documentation/timers/timer_stats.txt)
