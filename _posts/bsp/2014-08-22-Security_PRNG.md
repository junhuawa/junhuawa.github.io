---
layout: post
title: "PRNG"
date: 2014-08-22
category: "bsp"
tags: [bsp]
---
### Linux Pseudo Random Number Generator (PRNG)

/dev/random /dev/urandom

- the kernel will call get_random_bytes() to consume entropy;

when cat /dev/urandom, it will try to get entropy from the input pool, if there is enough entropy, it will get it from the input pool. 
It never get all entropys from the input pool.

- Always reserve 16 bytes in the input pool. it mix the data from input pool to non blocking pool, then use sha1 to output the encrypted values.
Every time, it get 10 bytes random data, 
If client only need < 10bytes, other bytes will be dropped, it has a fold() operation;

- add_interrupt_randomness() will be called if IRQF_SAMPLE_RANDOM is set for the interrupt when calling request_irq(). 
It will use jiffies, cpu cycles(by rdtsc), interrupt number to construct a structure and transfer it to add_timer_randomness(); 
in the function, it will check if the entropy in input pool is full(128 * 28 = 3584 bits), if full, it will not add the entropy.
if not, mix the data to the input pool(by func mix_pool_bytes()); then calculate the delta-3, 
use it as the entropy of the data and add it to the input_pool.entropy_count;
if there is process block, wakeup it.

- mix_pool_bytes(), it uses LFSR and Twisted LFSR to diffuse the entropy into the pool.

	Not know the twist_table?
  *. First, extend every byte to a 32-bit word. 
  *. use LFSR to diffuse the input. 
  *. use TGFSR to let it have a maximal period(2*128*32);

- When the random char device is initialized, some system related info will be mixed into the input pool as entropy source.

- If we write random data to the /dev/random, it will not increase the entropy bits. Unless use ioctl(RNDADDENTROPY) to add entropy;

- input pool size: 128 word, 1 word is 32 bits, 4096 bits in all

  block/non-block pool size: 32 word, 1024 bits;

- 	random_read_wakeup_thresh = 64

	random_write_wakeup_thresh = 128;

- The delta calculation for entropy collection is not follow the Shannon's entropy formula. But no better solution.

- the variable exported to the /proc/sys/kernel/random/

	poolsize: input_pool.pool_size;
	entropy_avail: input_pool.entropy_count

----

haveged: 
    it create random data, and poll if the LPRNG is lack of the entropy, if yes, it will fill enough entropy to the /dev/random by ioctl cmd. 

Yarrow: 

    used in Freebsd, use SHA256 as hash function for entropy harvesting, AES256 to extract random data from the pool. 
	The entropy bits for every call of every source is set by the programmer;
	fast pool, slow pool. Fast pool reseed if the entropy bits > threshold
	slow pool reseed if the 2 entropy bits of source > threshold
	Yarrow is going to be replaced by Fortuna.
	The AES256 is used as counter mode to extract data;
	it only have /dev/urandom in Freebsd

----

5.1.4.2	Entropy bits harvested when NIC interrupt as an entropy source

In the test the amount of cumulated entropy was measured by increasing it with three bits for each incoming packet. 
The result was exported through the proc filesystem and recorded right after boot and again after one hour, 
when the systems had fully stabi-lized. The systems were not handling any real traffic but were mostly sitting idle during the test.
increasing it with three bits for each incoming packet. ?
These preliminary results show the potential of network traffic as an entropy source, 
especially considering that in a production environment the amount of traffic is much larger and the estimate of three bits for a packet is very conservative.

Classical MSS package's memory layout

    /McBED/sacks/y2env/10_31_0/public/dty/asm_form/dxsmemgx.adt

### Test step:

1) add the flag IRQF_SAMPLE_RANDOM to the interrupt register function request_irq(), only add it to the rx interrupt;

2) add code to random.c to read the sum of entropy bits which produced by the NIC interrupt. entropy_of_intr

3) issue below cmd to read entropy bits when the unit is ready after startup

cat /proc/sys/kernel/random/entropy_avail
cat /proc/sys/kernel/random/entropy_of_intr 

4) Let the unit run 1 hours and issue cmd above to read the entropy_of_intr and caculate the average entropy bits produced every 1 minutes

cat /proc/sys/kernel/random/entropy_avail
cat /proc/sys/kernel/random/entropy_of_intr 

5) use cmd "cat /dev/random" to see if output block;

### Adjust the generator polynomials in the mixing function slightly

tytso@mit.edu

Hi, Theodore:
   Nice to meet you! :-)
   I have found you have added a patch to the random.c of latest linux kernel. The patch is about adjust the generator polynomials in the mixing function slightly
   https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/drivers/char/random.c?id=6e9fa2c8a630e6d0882828012431038abce285b9
   I think you must a Crypto expert, so I want to ask you some questions about the paper. in the paper(The Linux Pseudorandom Number Generator Revisited.pdf), it mentioned 3 worries, the GFSR, entropy estimator and SHA-1 hash function.
   To entropy estimator, do you think we need to improve the one used by random.c since it's not follow Shannon's entropy definition? why current linux kernel still use this algorithm instead of others?
   To the sha-1 function, do you think we need to replace the sha-1 to sha-256? Why current latest linux kernel still use the sha-1 instead of sha-256?
   Could you help me to answer my question? thanks very much! :)

http://lwn.net/Articles/182874/
On the safety of Linux random numbers
------------------------------
Testing PRNG on ACPI4/ACPI5/VMWARE/OPENSTACK environment
1) cat /proc/sys/kernel/random/entropy_avail in init SS_LNXbase
2)
ACPI5
$ENV_ROOT/build/bin/dxloada -us -fn 0x000E3001E -is "LNXELF07.TST 0.0-0 14/01/02" -op LNXELF07.IMG vmlinux  ;
------------------
/linux_builds/dxscm/WR_Kernel/wrl-403.010/WR/wrenv.sh -p wrlinux-4
----
uptime
cat /proc/sys/kernel/random/entropy_avail
cat /proc/sys/kernel/random/entropy_of_intr 
cat /proc/sys/kernel/random/intr_count
uptime


From 2014-08-22 to 2015-05
