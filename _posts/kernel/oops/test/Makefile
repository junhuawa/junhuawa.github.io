obj-m	:= oops.o
KDIR	:= /lib/modules/$(shell uname -r)/build
PWD 	:= $(shell pwd)
SYM=$(PWD)

all:
		$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules

.PHONY: clean
clean:
		rm -rf *.o *.ko *.order *.symvers *.mod.c
