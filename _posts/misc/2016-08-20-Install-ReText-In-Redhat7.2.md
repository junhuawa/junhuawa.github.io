---
layout: post
title: "Install ReText in Redhat7.2"
date: 2016-08-20
category: "misc" 
tags: [ReText]
---
# Install ReText in Redhat 7.2

1. Follow the guide in [http://www.centoscn.com/image-text/install/2015/0516/5455.html](URL)

2. run retext report error  

**The module don't have the method "set_start_menu()"**  

**My python3 version is 3.3**  

3. Check the method manually.  

```sh
[junhuawa@Tesla ~]$ python3
Python 3.3.2 (default, Oct 11 2015, 17:47:16)   
[GCC 4.8.3 20140911 (Red Hat 4.8.3-9)] on linux2  
Type "help", "copyright", "credits" or "license" for more information.  
>>> import multiprocessing  
>>> dir(multiprocessing)  
['Array', 'AuthenticationError', 'BoundedSemaphore', 'BufferTooShort', 'Condition', 'Event', 'JoinableQueue', 'Lock', 'Manager', 'Pipe', 'Pool', 'Process', 'ProcessError', 'Queue', 'RLock', 'RawArray', 'RawValue', 'SUBDEBUG', 'SUBWARNING', 'Semaphore', 'TimeoutError', 'Value', '__all__', '__author__', '__builtins__', '__doc__', '__file__', '__name__', '__package__', '__path__', '__version__', '_multiprocessing', 'active_children', 'allow_connection_pickling', 'cpu_count', 'current_process', 'freeze_support', 'get_logger', 'log_to_stderr', 'os', 'process', 'sys', 'util']  
>>>   
```

Yes, there is no set_start_method() in multiprocessing module.  

**The method was added officially in python3.4.**  

4. Reinstall the python3.4  

    yum remove python3  
    yum remove python3-libs  
    yum install python3.4 python3.4-setuptools python3.4-devel  

```sh
[junhuawa@Tesla ~]$ rpm -qa |grep python34  
python34-libs-3.4.3-5.el7.x86_64  
python34-setuptools-19.2-3.el7.noarch  
python34-devel-3.4.3-5.el7.x86_64  
python34-3.4.3-5.el7.x86_64  
[junhuawa@Tesla ~]$   
```

manually install the pip3.4  

5. Follow the guide to install other packages  

    sudo yum install qt5*  
    install sip-4.18.1 by download the package  
    install PyQt5  
    sudo python3-pip install markups   
    sudo pip3.4 install markdown  
    sudo pip3.4 install docutils  
    sudo pip3.4 install pyenchant  

6. Install the ReText  
