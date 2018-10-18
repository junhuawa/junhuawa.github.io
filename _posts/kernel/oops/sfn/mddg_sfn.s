
fcmd/kernel/extra/sfn/mddg_sfn.ko:     file format elf32-powerpc


Disassembly of section .text:

00000000 <_save32gpr_14>:
       0:	91 cb ff b8 	stw     r14,-72(r11)

00000004 <_save32gpr_15>:
       4:	91 eb ff bc 	stw     r15,-68(r11)

00000008 <_save32gpr_16>:
       8:	92 0b ff c0 	stw     r16,-64(r11)

0000000c <_save32gpr_17>:
       c:	92 2b ff c4 	stw     r17,-60(r11)

00000010 <_save32gpr_18>:
      10:	92 4b ff c8 	stw     r18,-56(r11)

00000014 <_save32gpr_19>:
      14:	92 6b ff cc 	stw     r19,-52(r11)

00000018 <_save32gpr_20>:
      18:	92 8b ff d0 	stw     r20,-48(r11)

0000001c <_save32gpr_21>:
      1c:	92 ab ff d4 	stw     r21,-44(r11)

00000020 <_save32gpr_22>:
      20:	92 cb ff d8 	stw     r22,-40(r11)

00000024 <_save32gpr_23>:
      24:	92 eb ff dc 	stw     r23,-36(r11)

00000028 <_save32gpr_24>:
      28:	93 0b ff e0 	stw     r24,-32(r11)

0000002c <_save32gpr_25>:
      2c:	93 2b ff e4 	stw     r25,-28(r11)

00000030 <_save32gpr_26>:
      30:	93 4b ff e8 	stw     r26,-24(r11)

00000034 <_save32gpr_27>:
      34:	93 6b ff ec 	stw     r27,-20(r11)

00000038 <_save32gpr_28>:
      38:	93 8b ff f0 	stw     r28,-16(r11)

0000003c <_save32gpr_29>:
      3c:	93 ab ff f4 	stw     r29,-12(r11)

00000040 <_save32gpr_30>:
      40:	93 cb ff f8 	stw     r30,-8(r11)

00000044 <_save32gpr_31>:
      44:	93 eb ff fc 	stw     r31,-4(r11)
      48:	4e 80 00 20 	blr

0000004c <_rest32gpr_14>:
      4c:	81 cb ff b8 	lwz     r14,-72(r11)

00000050 <_rest32gpr_15>:
      50:	81 eb ff bc 	lwz     r15,-68(r11)

00000054 <_rest32gpr_16>:
      54:	82 0b ff c0 	lwz     r16,-64(r11)

00000058 <_rest32gpr_17>:
      58:	82 2b ff c4 	lwz     r17,-60(r11)

0000005c <_rest32gpr_18>:
      5c:	82 4b ff c8 	lwz     r18,-56(r11)

00000060 <_rest32gpr_19>:
      60:	82 6b ff cc 	lwz     r19,-52(r11)

00000064 <_rest32gpr_20>:
      64:	82 8b ff d0 	lwz     r20,-48(r11)

00000068 <_rest32gpr_21>:
      68:	82 ab ff d4 	lwz     r21,-44(r11)

0000006c <_rest32gpr_22>:
      6c:	82 cb ff d8 	lwz     r22,-40(r11)

00000070 <_rest32gpr_23>:
      70:	82 eb ff dc 	lwz     r23,-36(r11)

00000074 <_rest32gpr_24>:
      74:	83 0b ff e0 	lwz     r24,-32(r11)

00000078 <_rest32gpr_25>:
      78:	83 2b ff e4 	lwz     r25,-28(r11)

0000007c <_rest32gpr_26>:
      7c:	83 4b ff e8 	lwz     r26,-24(r11)

00000080 <_rest32gpr_27>:
      80:	83 6b ff ec 	lwz     r27,-20(r11)

00000084 <_rest32gpr_28>:
      84:	83 8b ff f0 	lwz     r28,-16(r11)

00000088 <_rest32gpr_29>:
      88:	83 ab ff f4 	lwz     r29,-12(r11)

0000008c <_rest32gpr_30>:
      8c:	83 cb ff f8 	lwz     r30,-8(r11)

00000090 <_rest32gpr_31>:
      90:	83 eb ff fc 	lwz     r31,-4(r11)
      94:	4e 80 00 20 	blr

00000098 <_rest32gpr_14_x>:
      98:	81 cb ff b8 	lwz     r14,-72(r11)

0000009c <_rest32gpr_15_x>:
      9c:	81 eb ff bc 	lwz     r15,-68(r11)

000000a0 <_rest32gpr_16_x>:
      a0:	82 0b ff c0 	lwz     r16,-64(r11)

000000a4 <_rest32gpr_17_x>:
      a4:	82 2b ff c4 	lwz     r17,-60(r11)

000000a8 <_rest32gpr_18_x>:
      a8:	82 4b ff c8 	lwz     r18,-56(r11)

000000ac <_rest32gpr_19_x>:
      ac:	82 6b ff cc 	lwz     r19,-52(r11)

000000b0 <_rest32gpr_20_x>:
      b0:	82 8b ff d0 	lwz     r20,-48(r11)

000000b4 <_rest32gpr_21_x>:
      b4:	82 ab ff d4 	lwz     r21,-44(r11)

000000b8 <_rest32gpr_22_x>:
      b8:	82 cb ff d8 	lwz     r22,-40(r11)

000000bc <_rest32gpr_23_x>:
      bc:	82 eb ff dc 	lwz     r23,-36(r11)

000000c0 <_rest32gpr_24_x>:
      c0:	83 0b ff e0 	lwz     r24,-32(r11)

000000c4 <_rest32gpr_25_x>:
      c4:	83 2b ff e4 	lwz     r25,-28(r11)

000000c8 <_rest32gpr_26_x>:
      c8:	83 4b ff e8 	lwz     r26,-24(r11)

000000cc <_rest32gpr_27_x>:
      cc:	83 6b ff ec 	lwz     r27,-20(r11)

000000d0 <_rest32gpr_28_x>:
      d0:	83 8b ff f0 	lwz     r28,-16(r11)

000000d4 <_rest32gpr_29_x>:
      d4:	83 ab ff f4 	lwz     r29,-12(r11)

000000d8 <_rest32gpr_30_x>:
      d8:	83 cb ff f8 	lwz     r30,-8(r11)

000000dc <_rest32gpr_31_x>:
      dc:	80 0b 00 04 	lwz     r0,4(r11)
      e0:	83 eb ff fc 	lwz     r31,-4(r11)
      e4:	7c 08 03 a6 	mtlr    r0
      e8:	7d 61 5b 78 	mr      r1,r11
      ec:	4e 80 00 20 	blr

000000f0 <local_hsfn_update>:
struct timespec timestamp;

int poll_interrupt_sync = 0;                /*!< Syncronisation between ISR and sfn_poll*/

static void local_hsfn_update(u32 hsfn)
{
      f0:	94 21 ff d0 	stwu    r1,-48(r1)
      f4:	93 e1 00 2c 	stw     r31,44(r1)
      f8:	90 61 00 18 	stw     r3,24(r1)
    u16 low_12bits_sfn = hsfn & 0xFFF;
      fc:	81 21 00 18 	lwz     r9,24(r1)
     100:	55 29 04 3e 	clrlwi  r9,r9,16
     104:	55 29 05 3e 	clrlwi  r9,r9,20
     108:	b1 21 00 08 	sth     r9,8(r1)
    u16 casa_sfn = SFN_READ(sfn_number) & 0x0FFF;
     10c:	3d 20 00 00 	lis     r9,0
     110:	81 29 00 00 	lwz     r9,0(r9)
     114:	91 21 00 0c 	stw     r9,12(r1)
     118:	81 21 00 0c 	lwz     r9,12(r1)
     11c:	91 21 00 10 	stw     r9,16(r1)
	IO_SET_SYNC_FLAG();						\
}


DEF_MMIO_IN_BE(in_8,     8, lbz);
DEF_MMIO_IN_BE(in_be16, 16, lhz);
     120:	81 21 00 10 	lwz     r9,16(r1)
     124:	7c 00 04 ac 	sync    
     128:	a3 e9 00 00 	lhz     r31,0(r9)
     12c:	0c 1f 00 00 	twi     0,r31,0
     130:	4c 00 01 2c 	isync
     134:	b3 e1 00 14 	sth     r31,20(r1)
     138:	a1 21 00 14 	lhz     r9,20(r1)
     13c:	55 29 04 3e 	clrlwi  r9,r9,16
     140:	55 29 05 3e 	clrlwi  r9,r9,20
     144:	b1 21 00 0a 	sth     r9,10(r1)
    if (casa_sfn < low_12bits_sfn)
     148:	a1 21 00 0a 	lhz     r9,10(r1)
     14c:	55 2a 04 3e 	clrlwi  r10,r9,16
     150:	a1 21 00 08 	lhz     r9,8(r1)
     154:	55 29 04 3e 	clrlwi  r9,r9,16
     158:	7f 8a 48 40 	cmplw   cr7,r10,r9
     15c:	40 9c 00 28 	bge     cr7,184 <local_hsfn_update+0x94>
        local_hsfn = (hsfn & 0xFF000) | casa_sfn + 0x1000;
     160:	81 21 00 18 	lwz     r9,24(r1)
     164:	55 2a 03 26 	rlwinm  r10,r9,0,12,19
     168:	a1 21 00 0a 	lhz     r9,10(r1)
     16c:	55 29 04 3e 	clrlwi  r9,r9,16
     170:	39 29 10 00 	addi    r9,r9,4096
     174:	7d 4a 4b 78 	or      r10,r10,r9
     178:	3d 20 00 00 	lis     r9,0
     17c:	91 49 00 00 	stw     r10,0(r9)
     180:	48 00 00 20 	b       1a0 <local_hsfn_update+0xb0>
    else
        local_hsfn = (hsfn & 0xFF000) | casa_sfn;
     184:	81 21 00 18 	lwz     r9,24(r1)
     188:	55 2a 03 26 	rlwinm  r10,r9,0,12,19
     18c:	a1 21 00 0a 	lhz     r9,10(r1)
     190:	55 29 04 3e 	clrlwi  r9,r9,16
     194:	7d 4a 4b 78 	or      r10,r10,r9
     198:	3d 20 00 00 	lis     r9,0
     19c:	91 49 00 00 	stw     r10,0(r9)
}
     1a0:	83 e1 00 2c 	lwz     r31,44(r1)
     1a4:	38 21 00 30 	addi    r1,r1,48
     1a8:	4e 80 00 20 	blr

000001ac <sfn_interrupt>:
 *
 * \retval      0           IRQ_HANDLED
 *
 */
static irqreturn_t sfn_interrupt(int irq, void *dev_id)
{
     1ac:	94 21 ff c0 	stwu    r1,-64(r1)
     1b0:	7c 08 02 a6 	mflr    r0
     1b4:	90 01 00 44 	stw     r0,68(r1)
     1b8:	90 61 00 38 	stw     r3,56(r1)
     1bc:	90 81 00 3c 	stw     r4,60(r1)
    struct struct_poll_sfn *sfn_interrupt_tmp;
    struct timeval osUtc;

    ktime_get_ts(&timestamp);   /*Set current time for SFN   */
     1c0:	3d 20 00 00 	lis     r9,0
     1c4:	38 69 00 00 	addi    r3,r9,0
     1c8:	48 00 00 01 	bl      1c8 <sfn_interrupt+0x1c>

#ifdef CONFIG_FCMD
    mddg_clk_frame_notifier();
     1cc:	48 00 00 01 	bl      1cc <sfn_interrupt+0x20>
    local_hsfn_update(local_hsfn);
     1d0:	3d 20 00 00 	lis     r9,0
     1d4:	81 29 00 00 	lwz     r9,0(r9)
     1d8:	7d 23 4b 78 	mr      r3,r9
     1dc:	4b ff ff 15 	bl      f0 <local_hsfn_update>
#endif

    if (bcn_n1 >= MAX_N1_COUNTER_VALUE)
     1e0:	3d 20 00 00 	lis     r9,0
     1e4:	39 29 00 00 	addi    r9,r9,0
     1e8:	81 49 00 04 	lwz     r10,4(r9)
     1ec:	81 29 00 00 	lwz     r9,0(r9)
     1f0:	2b 89 00 ff 	cmplwi  cr7,r9,255
     1f4:	41 9d 00 18 	bgt     cr7,20c <sfn_interrupt+0x60>
     1f8:	2f 89 00 ff 	cmpwi   cr7,r9,255
     1fc:	40 9e 00 2c 	bne     cr7,228 <sfn_interrupt+0x7c>
     200:	39 00 ff fe 	li      r8,-2
     204:	7f 8a 40 40 	cmplw   cr7,r10,r8
     208:	40 9d 00 20 	ble     cr7,228 <sfn_interrupt+0x7c>
    {
        bcn_n1 = 0;
     20c:	3d 20 00 00 	lis     r9,0
     210:	39 09 00 00 	addi    r8,r9,0
     214:	39 20 00 00 	li      r9,0
     218:	39 40 00 00 	li      r10,0
     21c:	91 28 00 00 	stw     r9,0(r8)
     220:	91 48 00 04 	stw     r10,4(r8)
     224:	48 00 00 2c 	b       250 <sfn_interrupt+0xa4>
    }
    else
    {
        bcn_n1 = bcn_n1 + 1; // BCN is SW counter
     228:	3d 20 00 00 	lis     r9,0
     22c:	39 29 00 00 	addi    r9,r9,0
     230:	81 49 00 04 	lwz     r10,4(r9)
     234:	81 29 00 00 	lwz     r9,0(r9)
     238:	31 4a 00 01 	addic   r10,r10,1
     23c:	7d 29 01 94 	addze   r9,r9
     240:	3d 00 00 00 	lis     r8,0
     244:	39 08 00 00 	addi    r8,r8,0
     248:	91 28 00 00 	stw     r9,0(r8)
     24c:	91 48 00 04 	stw     r10,4(r8)
    }

    if(bcn_n1_user_sync)     // sync bcn to fspc board
     250:	3d 20 00 00 	lis     r9,0
     254:	81 29 00 00 	lwz     r9,0(r9)
     258:	2f 89 00 00 	cmpwi   cr7,r9,0
     25c:	41 9e 00 34 	beq     cr7,290 <sfn_interrupt+0xe4>
    {
#ifdef CONFIG_FSPC
        SFN_WRITE(sfn_number, sfn_user_value);
#endif
        bcn_n1 = bcn_n1_user_value;
     260:	3d 20 00 00 	lis     r9,0
     264:	39 29 00 00 	addi    r9,r9,0
     268:	81 49 00 04 	lwz     r10,4(r9)
     26c:	81 29 00 00 	lwz     r9,0(r9)
     270:	3d 00 00 00 	lis     r8,0
     274:	39 08 00 00 	addi    r8,r8,0
     278:	91 28 00 00 	stw     r9,0(r8)
     27c:	91 48 00 04 	stw     r10,4(r8)
        bcn_n1_user_sync = 0;
     280:	3d 20 00 00 	lis     r9,0
     284:	39 40 00 00 	li      r10,0
     288:	91 49 00 00 	stw     r10,0(r9)
     28c:	48 00 00 80 	b       30c <sfn_interrupt+0x160>
    }
    else if (sfn_user_sync)
     290:	3d 20 00 00 	lis     r9,0
     294:	81 29 00 00 	lwz     r9,0(r9)
     298:	2f 89 00 00 	cmpwi   cr7,r9,0
     29c:	41 9e 00 50 	beq     cr7,2ec <sfn_interrupt+0x140>
    {   /*By sfn_ioctl => User set the SFN (SFN_SET)*/
        SFN_WRITE(sfn_number, sfn_user_value);
     2a0:	3d 20 00 00 	lis     r9,0
     2a4:	81 49 00 00 	lwz     r10,0(r9)
     2a8:	3d 20 00 00 	lis     r9,0
     2ac:	81 29 00 00 	lwz     r9,0(r9)
     2b0:	55 29 04 3e 	clrlwi  r9,r9,16
     2b4:	91 41 00 14 	stw     r10,20(r1)
     2b8:	b1 21 00 18 	sth     r9,24(r1)
     2bc:	81 21 00 14 	lwz     r9,20(r1)
     2c0:	91 21 00 1c 	stw     r9,28(r1)
     2c4:	a1 21 00 18 	lhz     r9,24(r1)
     2c8:	b1 21 00 20 	sth     r9,32(r1)
DEF_MMIO_IN_BE(in_be32, 32, lwz);
DEF_MMIO_IN_LE(in_le16, 16, lhbrx);
DEF_MMIO_IN_LE(in_le32, 32, lwbrx);

DEF_MMIO_OUT_BE(out_8,     8, stb);
DEF_MMIO_OUT_BE(out_be16, 16, sth);
     2cc:	81 21 00 1c 	lwz     r9,28(r1)
     2d0:	a1 41 00 20 	lhz     r10,32(r1)
     2d4:	7c 00 04 ac 	sync    
     2d8:	b1 49 00 00 	sth     r10,0(r9)
        sfn_user_sync = 0;
     2dc:	3d 20 00 00 	lis     r9,0
     2e0:	39 40 00 00 	li      r10,0
     2e4:	91 49 00 00 	stw     r10,0(r9)
     2e8:	48 00 00 24 	b       30c <sfn_interrupt+0x160>
    }
#ifdef CONFIG_FCMD
    else if (local_hsfn >= SFN_MAX)
     2ec:	3d 20 00 00 	lis     r9,0
     2f0:	81 49 00 00 	lwz     r10,0(r9)
     2f4:	3d 20 00 0f 	lis     r9,15
     2f8:	61 29 ff fe 	ori     r9,r9,65534
     2fc:	7f 8a 48 40 	cmplw   cr7,r10,r9
     300:	40 9d 00 0c 	ble     cr7,30c <sfn_interrupt+0x160>
    {
        local_hsfn_update(0);
     304:	38 60 00 00 	li      r3,0
     308:	4b ff fd e9 	bl      f0 <local_hsfn_update>
    {
        SFN_WRITE(sfn_number, SFN_READ(sfn_number)+1); /*By FSPC we simulate the Frame Register*/
    }
#endif

    if (bts_rtc_sync)
     30c:	3d 20 00 00 	lis     r9,0
     310:	81 29 00 00 	lwz     r9,0(r9)
     314:	2f 89 00 00 	cmpwi   cr7,r9,0
     318:	41 9e 00 50 	beq     cr7,368 <sfn_interrupt+0x1bc>
    { /* By sfn_ioctl => User set the BTS RTC and BCN pair */
        bts_rtc_value = bts_rtc_user_value;
     31c:	3d 20 00 00 	lis     r9,0
     320:	39 29 00 00 	addi    r9,r9,0
     324:	3d 40 00 00 	lis     r10,0
     328:	39 4a 00 00 	addi    r10,r10,0
     32c:	80 aa 00 00 	lwz     r5,0(r10)
     330:	80 ca 00 04 	lwz     r6,4(r10)
     334:	80 ea 00 08 	lwz     r7,8(r10)
     338:	81 0a 00 0c 	lwz     r8,12(r10)
     33c:	90 a9 00 00 	stw     r5,0(r9)
     340:	90 c9 00 04 	stw     r6,4(r9)
     344:	90 e9 00 08 	stw     r7,8(r9)
     348:	91 09 00 0c 	stw     r8,12(r9)
     34c:	81 0a 00 10 	lwz     r8,16(r10)
     350:	81 4a 00 14 	lwz     r10,20(r10)
     354:	91 09 00 10 	stw     r8,16(r9)
     358:	91 49 00 14 	stw     r10,20(r9)
        bts_rtc_sync = 0;
     35c:	3d 20 00 00 	lis     r9,0
     360:	39 40 00 00 	li      r10,0
     364:	91 49 00 00 	stw     r10,0(r9)
    }
    if (osutc_bts_rtc_sync)
     368:	3d 20 00 00 	lis     r9,0
     36c:	81 29 00 00 	lwz     r9,0(r9)
     370:	2f 89 00 00 	cmpwi   cr7,r9,0
     374:	41 9e 00 60 	beq     cr7,3d4 <sfn_interrupt+0x228>
    {
        do_gettimeofday(&osUtc);
     378:	39 21 00 28 	addi    r9,r1,40
     37c:	7d 23 4b 78 	mr      r3,r9
     380:	48 00 00 01 	bl      380 <sfn_interrupt+0x1d4>
        bts_rtc_value.bcn_n1 = bcn_n1;
     384:	3d 20 00 00 	lis     r9,0
     388:	39 29 00 00 	addi    r9,r9,0
     38c:	81 49 00 04 	lwz     r10,4(r9)
     390:	81 29 00 00 	lwz     r9,0(r9)
     394:	3d 00 00 00 	lis     r8,0
     398:	39 08 00 00 	addi    r8,r8,0
     39c:	91 28 00 08 	stw     r9,8(r8)
     3a0:	91 48 00 0c 	stw     r10,12(r8)
        bts_rtc_value.timestamp.tv_sec = osUtc.tv_sec;
     3a4:	81 41 00 28 	lwz     r10,40(r1)
     3a8:	3d 20 00 00 	lis     r9,0
     3ac:	39 29 00 00 	addi    r9,r9,0
     3b0:	91 49 00 10 	stw     r10,16(r9)
        bts_rtc_value.timestamp.tv_nsec = osUtc.tv_usec * 1000;
     3b4:	81 21 00 2c 	lwz     r9,44(r1)
     3b8:	1d 49 03 e8 	mulli   r10,r9,1000
     3bc:	3d 20 00 00 	lis     r9,0
     3c0:	39 29 00 00 	addi    r9,r9,0
     3c4:	91 49 00 14 	stw     r10,20(r9)
        osutc_bts_rtc_sync = 0;
     3c8:	3d 20 00 00 	lis     r9,0
     3cc:	39 40 00 00 	li      r10,0
     3d0:	91 49 00 00 	stw     r10,0(r9)
    }
    wake_up_interruptible(&sfn_next_queue); /*By sfn_ioctl => User wait next SFN (SFN_WAIT_NEXT)*/
     3d4:	3d 20 00 00 	lis     r9,0
     3d8:	38 69 00 00 	addi    r3,r9,0
     3dc:	38 80 00 01 	li      r4,1
     3e0:	38 a0 00 01 	li      r5,1
     3e4:	38 c0 00 00 	li      r6,0
     3e8:	48 00 00 01 	bl      3e8 <sfn_interrupt+0x23c>

    if (poll_interrupt_sync)
     3ec:	3d 20 00 00 	lis     r9,0
     3f0:	81 29 00 00 	lwz     r9,0(r9)
     3f4:	2f 89 00 00 	cmpwi   cr7,r9,0
     3f8:	41 9e 01 6c 	beq     cr7,564 <sfn_interrupt+0x3b8>
    {   /*Syncronisation between ISR and sfn_poll (SFN_WAIT_FOR and SFN_WAIT_ASYNC)*/
        list_for_each_entry(sfn_interrupt_tmp, &global_poll_struct.poll_list,
     3fc:	3d 20 00 00 	lis     r9,0
     400:	39 29 00 00 	addi    r9,r9,0
     404:	81 29 00 1c 	lwz     r9,28(r9)
     408:	91 21 00 0c 	stw     r9,12(r1)
     40c:	81 21 00 0c 	lwz     r9,12(r1)
     410:	39 29 ff e4 	addi    r9,r9,-28
     414:	91 21 00 08 	stw     r9,8(r1)
     418:	48 00 01 04 	b       51c <sfn_interrupt+0x370>
                            poll_list)
        {
            printk("got sfn interrupt_tmp\n");
     41c:	3d 20 00 00 	lis     r9,0
     420:	38 69 00 00 	addi    r3,r9,0
     424:	4c c6 31 82 	crclr   4*cr1+eq
     428:	48 00 00 01 	bl      428 <sfn_interrupt+0x27c>
            if (sfn_interrupt_tmp->sfn_periodic)
     42c:	81 21 00 08 	lwz     r9,8(r1)
     430:	81 29 00 10 	lwz     r9,16(r9)
     434:	2f 89 00 00 	cmpwi   cr7,r9,0
     438:	41 9e 00 74 	beq     cr7,4ac <sfn_interrupt+0x300>
                    sfn_interrupt_tmp->sfn_tmp = SFN_READ(sfn_number);
                    wake_up_interruptible(&sfn_interrupt_tmp->irq_wait);
                }
#endif
#ifdef CONFIG_FCMD
                if (!(local_hsfn % sfn_interrupt_tmp->sfn_periodic)
     43c:	3d 20 00 00 	lis     r9,0
     440:	81 29 00 00 	lwz     r9,0(r9)
     444:	81 41 00 08 	lwz     r10,8(r1)
     448:	81 4a 00 10 	lwz     r10,16(r10)
     44c:	7d 09 53 96 	divwu   r8,r9,r10
     450:	7d 48 51 d6 	mullw   r10,r8,r10
     454:	7d 2a 48 50 	subf    r9,r10,r9
     458:	2f 89 00 00 	cmpwi   cr7,r9,0
     45c:	40 9e 00 a8 	bne     cr7,504 <sfn_interrupt+0x358>
                        && local_hsfn)
     460:	3d 20 00 00 	lis     r9,0
     464:	81 29 00 00 	lwz     r9,0(r9)
     468:	2f 89 00 00 	cmpwi   cr7,r9,0
     46c:	41 9e 00 98 	beq     cr7,504 <sfn_interrupt+0x358>
                {
                    sfn_interrupt_tmp->sync = 1;        /*needed by sfn_poll*/
     470:	81 21 00 08 	lwz     r9,8(r1)
     474:	39 40 00 01 	li      r10,1
     478:	91 49 00 04 	stw     r10,4(r9)
                    sfn_interrupt_tmp->sfn_tmp = local_hsfn;
     47c:	3d 20 00 00 	lis     r9,0
     480:	81 49 00 00 	lwz     r10,0(r9)
     484:	81 21 00 08 	lwz     r9,8(r1)
     488:	91 49 00 08 	stw     r10,8(r9)
                    wake_up_interruptible(&sfn_interrupt_tmp->irq_wait);
     48c:	81 21 00 08 	lwz     r9,8(r1)
     490:	39 29 00 14 	addi    r9,r9,20
     494:	7d 23 4b 78 	mr      r3,r9
     498:	38 80 00 01 	li      r4,1
     49c:	38 a0 00 01 	li      r5,1
     4a0:	38 c0 00 00 	li      r6,0
     4a4:	48 00 00 01 	bl      4a4 <sfn_interrupt+0x2f8>
     4a8:	48 00 00 5c 	b       504 <sfn_interrupt+0x358>
                    sfn_interrupt_tmp->sfn_tmp = SFN_READ(sfn_number);
                    wake_up_interruptible(&sfn_interrupt_tmp->irq_wait);
                }
#endif
#ifdef CONFIG_FCMD
                if ((local_hsfn % 4096) == (sfn_interrupt_tmp->sfn_specific % 4096))
     4ac:	81 21 00 08 	lwz     r9,8(r1)
     4b0:	81 49 00 0c 	lwz     r10,12(r9)
     4b4:	3d 20 00 00 	lis     r9,0
     4b8:	81 29 00 00 	lwz     r9,0(r9)
     4bc:	7d 49 4a 78 	xor     r9,r10,r9
     4c0:	55 29 05 3e 	clrlwi  r9,r9,20
     4c4:	2f 89 00 00 	cmpwi   cr7,r9,0
     4c8:	40 9e 00 3c 	bne     cr7,504 <sfn_interrupt+0x358>
                {
                    sfn_interrupt_tmp->sync = 1;        /*needed by sfn_poll*/
     4cc:	81 21 00 08 	lwz     r9,8(r1)
     4d0:	39 40 00 01 	li      r10,1
     4d4:	91 49 00 04 	stw     r10,4(r9)
                    sfn_interrupt_tmp->sfn_tmp = local_hsfn;
     4d8:	3d 20 00 00 	lis     r9,0
     4dc:	81 49 00 00 	lwz     r10,0(r9)
     4e0:	81 21 00 08 	lwz     r9,8(r1)
     4e4:	91 49 00 08 	stw     r10,8(r9)
                    wake_up_interruptible(&sfn_interrupt_tmp->irq_wait);
     4e8:	81 21 00 08 	lwz     r9,8(r1)
     4ec:	39 29 00 14 	addi    r9,r9,20
     4f0:	7d 23 4b 78 	mr      r3,r9
     4f4:	38 80 00 01 	li      r4,1
     4f8:	38 a0 00 01 	li      r5,1
     4fc:	38 c0 00 00 	li      r6,0
     500:	48 00 00 01 	bl      500 <sfn_interrupt+0x354>
    }
    wake_up_interruptible(&sfn_next_queue); /*By sfn_ioctl => User wait next SFN (SFN_WAIT_NEXT)*/

    if (poll_interrupt_sync)
    {   /*Syncronisation between ISR and sfn_poll (SFN_WAIT_FOR and SFN_WAIT_ASYNC)*/
        list_for_each_entry(sfn_interrupt_tmp, &global_poll_struct.poll_list,
     504:	81 21 00 08 	lwz     r9,8(r1)
     508:	81 29 00 1c 	lwz     r9,28(r9)
     50c:	91 21 00 10 	stw     r9,16(r1)
     510:	81 21 00 10 	lwz     r9,16(r1)
     514:	39 29 ff e4 	addi    r9,r9,-28
     518:	91 21 00 08 	stw     r9,8(r1)
     51c:	81 21 00 08 	lwz     r9,8(r1)
     520:	81 29 00 1c 	lwz     r9,28(r9)
     524:	91 21 00 24 	stw     r9,36(r1)
#define ARCH_HAS_PREFETCHW
#define ARCH_HAS_SPINLOCK_PREFETCH

static inline void prefetch(const void *x)
{
	if (unlikely(!x))
     528:	81 21 00 24 	lwz     r9,36(r1)
     52c:	2f 89 00 00 	cmpwi   cr7,r9,0
     530:	39 20 00 00 	li      r9,0
     534:	39 40 00 01 	li      r10,1
     538:	7d 2a 4f 9e 	isel    r9,r10,r9,30
     53c:	55 29 06 3e 	clrlwi  r9,r9,24
     540:	2f 89 00 00 	cmpwi   cr7,r9,0
     544:	40 9e 00 0c 	bne     cr7,550 <sfn_interrupt+0x3a4>
		return;

	__asm__ __volatile__ ("dcbt 0,%0" : : "r" (x));
     548:	81 21 00 24 	lwz     r9,36(r1)
     54c:	7c 00 4a 2c 	dcbt    0,r9
     550:	81 41 00 08 	lwz     r10,8(r1)
     554:	3d 20 00 00 	lis     r9,0
     558:	39 29 00 00 	addi    r9,r9,0
     55c:	7f 8a 48 00 	cmpw    cr7,r10,r9
     560:	40 9e fe bc 	bne     cr7,41c <sfn_interrupt+0x270>
#endif
            }
        }
    }

    return IRQ_HANDLED;         /* handled */
     564:	39 20 00 01 	li      r9,1
}
     568:	7d 23 4b 78 	mr      r3,r9
     56c:	80 01 00 44 	lwz     r0,68(r1)
     570:	7c 08 03 a6 	mtlr    r0
     574:	38 21 00 40 	addi    r1,r1,64
     578:	4e 80 00 20 	blr

0000057c <calculate_current_bts_rtc>:
/**
 *       Calculate current BTS RTC from current BCN N1 and earlier stored reference BTS RTC, BCN value pair
 *
 */
static void calculate_current_bts_rtc(struct sfn_data * bts_rtc_bcn_pair)
{
     57c:	94 21 ff 70 	stwu    r1,-144(r1)
     580:	7c 08 02 a6 	mflr    r0
     584:	90 01 00 94 	stw     r0,148(r1)
     588:	bf 41 00 78 	stmw    r26,120(r1)
     58c:	90 61 00 68 	stw     r3,104(r1)
    u64 bcn_delta_n1, bcn_delta_ns, bcn_delta_sec;
    struct timespec bts_rtc_time = {0,0};
     590:	39 20 00 00 	li      r9,0
     594:	91 21 00 50 	stw     r9,80(r1)
     598:	39 20 00 00 	li      r9,0
     59c:	91 21 00 54 	stw     r9,84(r1)

    // Sanity checks
    if (bcn_n1 < bts_rtc_value.bcn_n1)
     5a0:	3d 20 00 00 	lis     r9,0
     5a4:	39 29 00 00 	addi    r9,r9,0
     5a8:	80 e9 00 08 	lwz     r7,8(r9)
     5ac:	81 09 00 0c 	lwz     r8,12(r9)
     5b0:	3d 20 00 00 	lis     r9,0
     5b4:	39 29 00 00 	addi    r9,r9,0
     5b8:	81 49 00 04 	lwz     r10,4(r9)
     5bc:	81 29 00 00 	lwz     r9,0(r9)
     5c0:	7f 87 48 40 	cmplw   cr7,r7,r9
     5c4:	41 9d 00 14 	bgt     cr7,5d8 <calculate_current_bts_rtc+0x5c>
     5c8:	7f 87 48 00 	cmpw    cr7,r7,r9
     5cc:	40 9e 00 48 	bne     cr7,614 <calculate_current_bts_rtc+0x98>
     5d0:	7f 88 50 40 	cmplw   cr7,r8,r10
     5d4:	40 9d 00 40 	ble     cr7,614 <calculate_current_bts_rtc+0x98>
    {
        printk(KERN_WARNING "Current BCN smaller than BTS RTC BCN; resync needed\n");
     5d8:	3d 20 00 00 	lis     r9,0
     5dc:	38 69 00 00 	addi    r3,r9,0
     5e0:	4c c6 31 82 	crclr   4*cr1+eq
     5e4:	48 00 00 01 	bl      5e4 <calculate_current_bts_rtc+0x68>
        bts_rtc_bcn_pair->bcn_n1 = 0ULL;
     5e8:	81 01 00 68 	lwz     r8,104(r1)
     5ec:	39 20 00 00 	li      r9,0
     5f0:	39 40 00 00 	li      r10,0
     5f4:	91 28 00 08 	stw     r9,8(r8)
     5f8:	91 48 00 0c 	stw     r10,12(r8)
        bts_rtc_bcn_pair->timestamp = bts_rtc_time;
     5fc:	81 21 00 68 	lwz     r9,104(r1)
     600:	81 01 00 50 	lwz     r8,80(r1)
     604:	81 41 00 54 	lwz     r10,84(r1)
     608:	91 09 00 10 	stw     r8,16(r9)
     60c:	91 49 00 14 	stw     r10,20(r9)
     610:	48 00 02 c0 	b       8d0 <calculate_current_bts_rtc+0x354>
        return;
    }

    bts_rtc_time = bts_rtc_value.timestamp; // Take BTS RTC reference point as a starting point
     614:	3d 20 00 00 	lis     r9,0
     618:	39 29 00 00 	addi    r9,r9,0
     61c:	81 49 00 10 	lwz     r10,16(r9)
     620:	81 29 00 14 	lwz     r9,20(r9)
     624:	91 41 00 50 	stw     r10,80(r1)
     628:	91 21 00 54 	stw     r9,84(r1)

    bcn_delta_n1 = bcn_n1 - bts_rtc_value.bcn_n1; // delta in BCN N1 values
     62c:	3d 20 00 00 	lis     r9,0
     630:	39 29 00 00 	addi    r9,r9,0
     634:	80 e9 00 00 	lwz     r7,0(r9)
     638:	81 09 00 04 	lwz     r8,4(r9)
     63c:	3d 20 00 00 	lis     r9,0
     640:	39 29 00 00 	addi    r9,r9,0
     644:	81 49 00 0c 	lwz     r10,12(r9)
     648:	81 29 00 08 	lwz     r9,8(r9)
     64c:	7d 4a 40 10 	subfc   r10,r10,r8
     650:	7d 29 39 10 	subfe   r9,r9,r7
     654:	91 21 00 10 	stw     r9,16(r1)
     658:	91 41 00 14 	stw     r10,20(r1)
    bcn_delta_sec = bcn_delta_n1;
     65c:	81 21 00 10 	lwz     r9,16(r1)
     660:	81 41 00 14 	lwz     r10,20(r1)
     664:	91 21 00 48 	stw     r9,72(r1)
     668:	91 41 00 4c 	stw     r10,76(r1)
    do_div(bcn_delta_sec, 100); // delta in full seconds
     66c:	39 20 00 64 	li      r9,100
     670:	91 21 00 18 	stw     r9,24(r1)
     674:	81 21 00 48 	lwz     r9,72(r1)
     678:	81 41 00 4c 	lwz     r10,76(r1)
     67c:	7d 26 4b 78 	mr      r6,r9
     680:	38 a0 00 00 	li      r5,0
     684:	7c a9 33 78 	or      r9,r5,r6
     688:	2f 89 00 00 	cmpwi   cr7,r9,0
     68c:	39 20 00 00 	li      r9,0
     690:	39 40 00 01 	li      r10,1
     694:	7d 2a 4f 9e 	isel    r9,r10,r9,30
     698:	55 29 06 3e 	clrlwi  r9,r9,24
     69c:	2f 89 00 00 	cmpwi   cr7,r9,0
     6a0:	41 9e 00 4c 	beq     cr7,6ec <calculate_current_bts_rtc+0x170>
     6a4:	81 21 00 48 	lwz     r9,72(r1)
     6a8:	81 41 00 4c 	lwz     r10,76(r1)
     6ac:	7d 49 53 78 	mr      r9,r10
     6b0:	81 41 00 18 	lwz     r10,24(r1)
     6b4:	7d 09 53 96 	divwu   r8,r9,r10
     6b8:	81 41 00 18 	lwz     r10,24(r1)
     6bc:	7d 48 51 d6 	mullw   r10,r8,r10
     6c0:	7d 2a 48 50 	subf    r9,r10,r9
     6c4:	91 21 00 08 	stw     r9,8(r1)
     6c8:	81 21 00 48 	lwz     r9,72(r1)
     6cc:	81 41 00 4c 	lwz     r10,76(r1)
     6d0:	81 21 00 18 	lwz     r9,24(r1)
     6d4:	7d 2a 4b 96 	divwu   r9,r10,r9
     6d8:	7d 2c 4b 78 	mr      r12,r9
     6dc:	39 60 00 00 	li      r11,0
     6e0:	91 61 00 48 	stw     r11,72(r1)
     6e4:	91 81 00 4c 	stw     r12,76(r1)
     6e8:	48 00 00 18 	b       700 <calculate_current_bts_rtc+0x184>
     6ec:	39 21 00 48 	addi    r9,r1,72
     6f0:	7d 23 4b 78 	mr      r3,r9
     6f4:	80 81 00 18 	lwz     r4,24(r1)
     6f8:	48 00 00 01 	bl      6f8 <calculate_current_bts_rtc+0x17c>
     6fc:	90 61 00 08 	stw     r3,8(r1)
    bcn_delta_ns = (bcn_delta_n1 - (bcn_delta_sec * 100)) * 10000000L; // remaining delta N1 in nanoseconds
     700:	80 e1 00 48 	lwz     r7,72(r1)
     704:	81 01 00 4c 	lwz     r8,76(r1)
     708:	1d 47 00 64 	mulli   r10,r7,100
     70c:	1d 28 00 00 	mulli   r9,r8,0
     710:	7c ca 4a 14 	add     r6,r10,r9
     714:	38 a0 00 64 	li      r5,100
     718:	7d 28 28 16 	mulhwu  r9,r8,r5
     71c:	7d 48 29 d6 	mullw   r10,r8,r5
     720:	7d 06 4a 14 	add     r8,r6,r9
     724:	7d 09 43 78 	mr      r9,r8
     728:	80 e1 00 10 	lwz     r7,16(r1)
     72c:	81 01 00 14 	lwz     r8,20(r1)
     730:	7d 0a 40 10 	subfc   r8,r10,r8
     734:	7c e9 39 10 	subfe   r7,r9,r7
     738:	3d 20 00 98 	lis     r9,152
     73c:	61 29 96 80 	ori     r9,r9,38528
     740:	7d 47 49 d6 	mullw   r10,r7,r9
     744:	1d 28 00 00 	mulli   r9,r8,0
     748:	7c ca 4a 14 	add     r6,r10,r9
     74c:	3d 20 00 98 	lis     r9,152
     750:	61 25 96 80 	ori     r5,r9,38528
     754:	7d 28 28 16 	mulhwu  r9,r8,r5
     758:	7d 48 29 d6 	mullw   r10,r8,r5
     75c:	7d 06 4a 14 	add     r8,r6,r9
     760:	7d 09 43 78 	mr      r9,r8
     764:	91 21 00 20 	stw     r9,32(r1)
     768:	91 41 00 24 	stw     r10,36(r1)
     76c:	91 21 00 20 	stw     r9,32(r1)
     770:	91 41 00 24 	stw     r10,36(r1)

    // Add BCN delta as nanoseconds to BTS RTC starting time.
    // We add whole seconds beforehand since othervice we give
    // big value to timespec_add_ns which makes it slow.
    bts_rtc_time.tv_sec += bcn_delta_sec; // Add full seconds to destination
     774:	81 21 00 50 	lwz     r9,80(r1)
     778:	7d 28 4b 78 	mr      r8,r9
     77c:	81 21 00 48 	lwz     r9,72(r1)
     780:	81 41 00 4c 	lwz     r10,76(r1)
     784:	7d 49 53 78 	mr      r9,r10
     788:	7d 28 4a 14 	add     r9,r8,r9
     78c:	91 21 00 50 	stw     r9,80(r1)
    timespec_add_ns(&bts_rtc_time, bcn_delta_ns);
     790:	39 21 00 50 	addi    r9,r1,80
     794:	91 21 00 28 	stw     r9,40(r1)
     798:	81 21 00 20 	lwz     r9,32(r1)
     79c:	81 41 00 24 	lwz     r10,36(r1)
     7a0:	91 21 00 58 	stw     r9,88(r1)
     7a4:	91 41 00 5c 	stw     r10,92(r1)
 * This must always be inlined because its used from the x86-64 vdso,
 * which cannot call other kernel functions.
 */
static __always_inline void timespec_add_ns(struct timespec *a, u64 ns)
{
	a->tv_sec += __iter_div_u64_rem(a->tv_nsec + ns, NSEC_PER_SEC, &ns);
     7a8:	81 21 00 28 	lwz     r9,40(r1)
     7ac:	81 29 00 00 	lwz     r9,0(r9)
     7b0:	7d 28 4b 78 	mr      r8,r9
     7b4:	81 21 00 28 	lwz     r9,40(r1)
     7b8:	81 29 00 04 	lwz     r9,4(r9)
     7bc:	7d 3f 4b 78 	mr      r31,r9
     7c0:	7d 29 fe 70 	srawi   r9,r9,31
     7c4:	7d 3e 4b 78 	mr      r30,r9
     7c8:	81 21 00 58 	lwz     r9,88(r1)
     7cc:	81 41 00 5c 	lwz     r10,92(r1)
     7d0:	7d 4a f8 14 	addc    r10,r10,r31
     7d4:	7d 29 f1 14 	adde    r9,r9,r30
     7d8:	91 21 00 30 	stw     r9,48(r1)
     7dc:	91 41 00 34 	stw     r10,52(r1)
     7e0:	3d 20 3b 9a 	lis     r9,15258
     7e4:	61 29 ca 00 	ori     r9,r9,51712
     7e8:	91 21 00 38 	stw     r9,56(r1)
     7ec:	39 21 00 58 	addi    r9,r1,88
     7f0:	91 21 00 3c 	stw     r9,60(r1)
u32 iter_div_u64_rem(u64 dividend, u32 divisor, u64 *remainder);

static __always_inline u32
__iter_div_u64_rem(u64 dividend, u32 divisor, u64 *remainder)
{
	u32 ret = 0;
     7f4:	39 20 00 00 	li      r9,0
     7f8:	91 21 00 40 	stw     r9,64(r1)
     7fc:	48 00 00 40 	b       83c <calculate_current_bts_rtc+0x2c0>

	while (dividend >= divisor) {
		/* The following asm() prevents the compiler from
		   optimising this loop into a modulo operation.  */
		asm("" : "+rm"(dividend));
     800:	83 c1 00 30 	lwz     r30,48(r1)
     804:	83 e1 00 34 	lwz     r31,52(r1)
     808:	93 c1 00 30 	stw     r30,48(r1)
     80c:	93 e1 00 34 	stw     r31,52(r1)

		dividend -= divisor;
     810:	83 61 00 38 	lwz     r27,56(r1)
     814:	3b 40 00 00 	li      r26,0
     818:	81 21 00 30 	lwz     r9,48(r1)
     81c:	81 41 00 34 	lwz     r10,52(r1)
     820:	7d 5b 50 10 	subfc   r10,r27,r10
     824:	7d 3a 49 10 	subfe   r9,r26,r9
     828:	91 21 00 30 	stw     r9,48(r1)
     82c:	91 41 00 34 	stw     r10,52(r1)
		ret++;
     830:	81 21 00 40 	lwz     r9,64(r1)
     834:	39 29 00 01 	addi    r9,r9,1
     838:	91 21 00 40 	stw     r9,64(r1)
static __always_inline u32
__iter_div_u64_rem(u64 dividend, u32 divisor, u64 *remainder)
{
	u32 ret = 0;

	while (dividend >= divisor) {
     83c:	83 a1 00 38 	lwz     r29,56(r1)
     840:	3b 80 00 00 	li      r28,0
     844:	81 21 00 30 	lwz     r9,48(r1)
     848:	7f 89 e0 40 	cmplw   cr7,r9,r28
     84c:	41 9c 00 1c 	blt     cr7,868 <calculate_current_bts_rtc+0x2ec>
     850:	81 21 00 30 	lwz     r9,48(r1)
     854:	7f 89 e0 00 	cmpw    cr7,r9,r28
     858:	40 9e ff a8 	bne     cr7,800 <calculate_current_bts_rtc+0x284>
     85c:	81 21 00 34 	lwz     r9,52(r1)
     860:	7f 89 e8 40 	cmplw   cr7,r9,r29
     864:	40 9c ff 9c 	bge     cr7,800 <calculate_current_bts_rtc+0x284>

		dividend -= divisor;
		ret++;
	}

	*remainder = dividend;
     868:	80 e1 00 3c 	lwz     r7,60(r1)
     86c:	81 21 00 30 	lwz     r9,48(r1)
     870:	81 41 00 34 	lwz     r10,52(r1)
     874:	91 27 00 00 	stw     r9,0(r7)
     878:	91 47 00 04 	stw     r10,4(r7)

	return ret;
     87c:	81 21 00 40 	lwz     r9,64(r1)
     880:	7d 28 4a 14 	add     r9,r8,r9
     884:	7d 2a 4b 78 	mr      r10,r9
     888:	81 21 00 28 	lwz     r9,40(r1)
     88c:	91 49 00 00 	stw     r10,0(r9)
	a->tv_nsec = ns;
     890:	81 21 00 58 	lwz     r9,88(r1)
     894:	81 41 00 5c 	lwz     r10,92(r1)
     898:	81 21 00 28 	lwz     r9,40(r1)
     89c:	91 49 00 04 	stw     r10,4(r9)

    bts_rtc_bcn_pair->bcn_n1 = bcn_n1;
     8a0:	3d 20 00 00 	lis     r9,0
     8a4:	39 29 00 00 	addi    r9,r9,0
     8a8:	81 49 00 04 	lwz     r10,4(r9)
     8ac:	81 29 00 00 	lwz     r9,0(r9)
     8b0:	81 01 00 68 	lwz     r8,104(r1)
     8b4:	91 28 00 08 	stw     r9,8(r8)
     8b8:	91 48 00 0c 	stw     r10,12(r8)
    bts_rtc_bcn_pair->timestamp = bts_rtc_time;
     8bc:	81 21 00 68 	lwz     r9,104(r1)
     8c0:	81 01 00 50 	lwz     r8,80(r1)
     8c4:	81 41 00 54 	lwz     r10,84(r1)
     8c8:	91 09 00 10 	stw     r8,16(r9)
     8cc:	91 49 00 14 	stw     r10,20(r9)
}
     8d0:	80 01 00 94 	lwz     r0,148(r1)
     8d4:	7c 08 03 a6 	mtlr    r0
     8d8:	bb 41 00 78 	lmw     r26,120(r1)
     8dc:	38 21 00 90 	addi    r1,r1,144
     8e0:	4e 80 00 20 	blr

000008e4 <sfn_ioctl>:
 * \retval      0           ok
 *
*/
static int sfn_ioctl(struct inode *inode, struct file *file, unsigned int cmd,
                     unsigned long arg)
{
     8e4:	94 21 fe d0 	stwu    r1,-304(r1)
     8e8:	7c 08 02 a6 	mflr    r0
     8ec:	90 01 01 34 	stw     r0,308(r1)
     8f0:	90 61 01 18 	stw     r3,280(r1)
     8f4:	90 81 01 1c 	stw     r4,284(r1)
     8f8:	90 a1 01 20 	stw     r5,288(r1)
     8fc:	90 c1 01 24 	stw     r6,292(r1)
    struct sfn_data sfn_param;
    struct struct_poll_sfn *pp = file->private_data;
     900:	81 21 01 1c 	lwz     r9,284(r1)
     904:	81 29 00 6c 	lwz     r9,108(r9)
     908:	91 21 00 08 	stw     r9,8(r1)
    u32 value_tmp;

    switch (cmd)
     90c:	81 21 01 20 	lwz     r9,288(r1)
     910:	3d 40 80 08 	lis     r10,-32760
     914:	61 4a f9 06 	ori     r10,r10,63750
     918:	7f 89 50 00 	cmpw    cr7,r9,r10
     91c:	41 9e 03 68 	beq     cr7,c84 <sfn_ioctl+0x3a0>
     920:	3d 40 80 08 	lis     r10,-32760
     924:	61 4a f9 06 	ori     r10,r10,63750
     928:	7f 89 50 40 	cmplw   cr7,r9,r10
     92c:	41 9d 00 6c 	bgt     cr7,998 <sfn_ioctl+0xb4>
     930:	3d 40 40 18 	lis     r10,16408
     934:	61 4a f9 03 	ori     r10,r10,63747
     938:	7f 89 50 00 	cmpw    cr7,r9,r10
     93c:	41 9e 09 44 	beq     cr7,1280 <sfn_ioctl+0x99c>
     940:	3d 40 40 18 	lis     r10,16408
     944:	61 4a f9 03 	ori     r10,r10,63747
     948:	7f 89 50 40 	cmplw   cr7,r9,r10
     94c:	41 9d 00 28 	bgt     cr7,974 <sfn_ioctl+0x90>
     950:	3d 40 40 08 	lis     r10,16392
     954:	61 4a f9 08 	ori     r10,r10,63752
     958:	7f 89 50 00 	cmpw    cr7,r9,r10
     95c:	41 9e 07 38 	beq     cr7,1094 <sfn_ioctl+0x7b0>
     960:	3d 40 40 18 	lis     r10,16408
     964:	61 4a f9 01 	ori     r10,r10,63745
     968:	7f 89 50 00 	cmpw    cr7,r9,r10
     96c:	41 9e 06 08 	beq     cr7,f74 <sfn_ioctl+0x690>
     970:	48 00 0f 28 	b       1898 <sfn_ioctl+0xfb4>
     974:	3d 40 80 04 	lis     r10,-32764
     978:	61 4a f9 02 	ori     r10,r10,63746
     97c:	7f 89 50 00 	cmpw    cr7,r9,r10
     980:	41 9e 01 b4 	beq     cr7,b34 <sfn_ioctl+0x250>
     984:	3d 40 80 04 	lis     r10,-32764
     988:	61 4a f9 0c 	ori     r10,r10,63756
     98c:	7f 89 50 00 	cmpw    cr7,r9,r10
     990:	41 9e 00 80 	beq     cr7,a10 <sfn_ioctl+0x12c>
     994:	48 00 0f 04 	b       1898 <sfn_ioctl+0xfb4>
     998:	3d 40 c0 18 	lis     r10,-16360
     99c:	61 4a f9 05 	ori     r10,r10,63749
     9a0:	7f 89 50 00 	cmpw    cr7,r9,r10
     9a4:	41 9e 0d 00 	beq     cr7,16a4 <sfn_ioctl+0xdc0>
     9a8:	3d 40 c0 18 	lis     r10,-16360
     9ac:	61 4a f9 05 	ori     r10,r10,63749
     9b0:	7f 89 50 40 	cmplw   cr7,r9,r10
     9b4:	41 9d 00 28 	bgt     cr7,9dc <sfn_ioctl+0xf8>
     9b8:	3d 40 80 18 	lis     r10,-32744
     9bc:	61 4a f9 07 	ori     r10,r10,63751
     9c0:	7f 89 50 00 	cmpw    cr7,r9,r10
     9c4:	41 9e 04 10 	beq     cr7,dd4 <sfn_ioctl+0x4f0>
     9c8:	3d 40 c0 18 	lis     r10,-16360
     9cc:	61 4a f9 04 	ori     r10,r10,63748
     9d0:	7f 89 50 00 	cmpw    cr7,r9,r10
     9d4:	41 9e 0a f8 	beq     cr7,14cc <sfn_ioctl+0xbe8>
     9d8:	48 00 0e c0 	b       1898 <sfn_ioctl+0xfb4>
     9dc:	3d 40 c0 18 	lis     r10,-16360
     9e0:	61 4a f9 0a 	ori     r10,r10,63754
     9e4:	7f 89 50 00 	cmpw    cr7,r9,r10
     9e8:	41 9e 09 dc 	beq     cr7,13c4 <sfn_ioctl+0xae0>
     9ec:	3d 40 c0 18 	lis     r10,-16360
     9f0:	61 4a f9 0b 	ori     r10,r10,63755
     9f4:	7f 89 50 00 	cmpw    cr7,r9,r10
     9f8:	41 9e 0e 90 	beq     cr7,1888 <sfn_ioctl+0xfa4>
     9fc:	3d 40 c0 18 	lis     r10,-16360
     a00:	61 4a f9 09 	ori     r10,r10,63753
     a04:	7f 89 50 00 	cmpw    cr7,r9,r10
     a08:	41 9e 07 7c 	beq     cr7,1184 <sfn_ioctl+0x8a0>
     a0c:	48 00 0e 8c 	b       1898 <sfn_ioctl+0xfb4>
    {
    case HSFN_SET:    //User set the extended sfn value(20 bits)
        if (copy_from_user(&sfn_user_value, (u32 *) arg, sizeof(u32)))  //sfn_user_value is global variable (set SFN in ISR)
     a10:	81 21 01 24 	lwz     r9,292(r1)
     a14:	3d 40 00 00 	lis     r10,0
     a18:	39 4a 00 00 	addi    r10,r10,0
     a1c:	91 41 00 0c 	stw     r10,12(r1)
     a20:	91 21 00 10 	stw     r9,16(r1)
     a24:	39 20 00 04 	li      r9,4
     a28:	91 21 00 14 	stw     r9,20(r1)
static inline unsigned long copy_from_user(void *to,
		const void __user *from, unsigned long n)
{
	unsigned long over;

	if (access_ok(VERIFY_READ, from, n))
     a2c:	81 41 00 10 	lwz     r10,16(r1)
     a30:	7c 49 13 78 	mr      r9,r2
     a34:	81 29 03 2c 	lwz     r9,812(r9)
     a38:	7f 8a 48 40 	cmplw   cr7,r10,r9
     a3c:	41 9d 00 38 	bgt     cr7,a74 <sfn_ioctl+0x190>
     a40:	81 21 00 14 	lwz     r9,20(r1)
     a44:	2f 89 00 00 	cmpwi   cr7,r9,0
     a48:	41 9e 00 24 	beq     cr7,a6c <sfn_ioctl+0x188>
     a4c:	81 21 00 14 	lwz     r9,20(r1)
     a50:	39 49 ff ff 	addi    r10,r9,-1
     a54:	7c 49 13 78 	mr      r9,r2
     a58:	81 09 03 2c 	lwz     r8,812(r9)
     a5c:	81 21 00 10 	lwz     r9,16(r1)
     a60:	7d 29 40 50 	subf    r9,r9,r8
     a64:	7f 8a 48 40 	cmplw   cr7,r10,r9
     a68:	41 9d 00 0c 	bgt     cr7,a74 <sfn_ioctl+0x190>
     a6c:	39 20 00 01 	li      r9,1
     a70:	48 00 00 08 	b       a78 <sfn_ioctl+0x194>
     a74:	39 20 00 00 	li      r9,0
     a78:	2f 89 00 00 	cmpwi   cr7,r9,0
     a7c:	41 9e 00 1c 	beq     cr7,a98 <sfn_ioctl+0x1b4>
		return __copy_tofrom_user((__force void __user *)to, from, n);
     a80:	80 61 00 0c 	lwz     r3,12(r1)
     a84:	80 81 00 10 	lwz     r4,16(r1)
     a88:	80 a1 00 14 	lwz     r5,20(r1)
     a8c:	48 00 00 01 	bl      a8c <sfn_ioctl+0x1a8>
     a90:	7c 69 1b 78 	mr      r9,r3
     a94:	48 00 00 5c 	b       af0 <sfn_ioctl+0x20c>
	if ((unsigned long)from < TASK_SIZE) {
     a98:	81 41 00 10 	lwz     r10,16(r1)
     a9c:	3d 20 bf ff 	lis     r9,-16385
     aa0:	61 29 ff ff 	ori     r9,r9,65535
     aa4:	7f 8a 48 40 	cmplw   cr7,r10,r9
     aa8:	41 9d 00 44 	bgt     cr7,aec <sfn_ioctl+0x208>
		over = (unsigned long)from + n - TASK_SIZE;
     aac:	81 41 00 10 	lwz     r10,16(r1)
     ab0:	81 21 00 14 	lwz     r9,20(r1)
     ab4:	7d 2a 4a 14 	add     r9,r10,r9
     ab8:	3d 29 40 00 	addis   r9,r9,16384
     abc:	91 21 00 18 	stw     r9,24(r1)
		return __copy_tofrom_user((__force void __user *)to, from,
     ac0:	81 41 00 14 	lwz     r10,20(r1)
     ac4:	81 21 00 18 	lwz     r9,24(r1)
     ac8:	7d 29 50 50 	subf    r9,r9,r10
     acc:	80 61 00 0c 	lwz     r3,12(r1)
     ad0:	80 81 00 10 	lwz     r4,16(r1)
     ad4:	7d 25 4b 78 	mr      r5,r9
     ad8:	48 00 00 01 	bl      ad8 <sfn_ioctl+0x1f4>
     adc:	7c 6a 1b 78 	mr      r10,r3
     ae0:	81 21 00 18 	lwz     r9,24(r1)
     ae4:	7d 2a 4a 14 	add     r9,r10,r9
     ae8:	48 00 00 08 	b       af0 <sfn_ioctl+0x20c>
				n - over) + over;
	}
	return n;
     aec:	81 21 00 14 	lwz     r9,20(r1)
     af0:	2f 89 00 00 	cmpwi   cr7,r9,0
     af4:	41 9e 00 0c 	beq     cr7,b00 <sfn_ioctl+0x21c>
            return -EFAULT;
     af8:	39 20 ff f2 	li      r9,-14
     afc:	48 00 0d e0 	b       18dc <sfn_ioctl+0xff8>
        if (sfn_user_value > SFN_MAX || sfn_user_value < 0)
     b00:	3d 20 00 00 	lis     r9,0
     b04:	81 49 00 00 	lwz     r10,0(r9)
     b08:	3d 20 00 0f 	lis     r9,15
     b0c:	61 29 ff ff 	ori     r9,r9,65535
     b10:	7f 8a 48 40 	cmplw   cr7,r10,r9
     b14:	40 9d 00 0c 	ble     cr7,b20 <sfn_ioctl+0x23c>
            return -EFAULT;
     b18:	39 20 ff f2 	li      r9,-14
     b1c:	48 00 0d c0 	b       18dc <sfn_ioctl+0xff8>
        local_hsfn_update(sfn_user_value);
     b20:	3d 20 00 00 	lis     r9,0
     b24:	81 29 00 00 	lwz     r9,0(r9)
     b28:	7d 23 4b 78 	mr      r3,r9
     b2c:	4b ff f5 c5 	bl      f0 <local_hsfn_update>
        break;
     b30:	48 00 0d a8 	b       18d8 <sfn_ioctl+0xff4>

    case SFN_SET:   //user set the sfn value(12 bits)
        if (copy_from_user(&sfn_user_value, (u32 *) arg, sizeof(u32)))  //sfn_user_value is global variable (set SFN in ISR)
     b34:	81 21 01 24 	lwz     r9,292(r1)
     b38:	3d 40 00 00 	lis     r10,0
     b3c:	39 4a 00 00 	addi    r10,r10,0
     b40:	91 41 00 1c 	stw     r10,28(r1)
     b44:	91 21 00 20 	stw     r9,32(r1)
     b48:	39 20 00 04 	li      r9,4
     b4c:	91 21 00 24 	stw     r9,36(r1)
static inline unsigned long copy_from_user(void *to,
		const void __user *from, unsigned long n)
{
	unsigned long over;

	if (access_ok(VERIFY_READ, from, n))
     b50:	81 41 00 20 	lwz     r10,32(r1)
     b54:	7c 49 13 78 	mr      r9,r2
     b58:	81 29 03 2c 	lwz     r9,812(r9)
     b5c:	7f 8a 48 40 	cmplw   cr7,r10,r9
     b60:	41 9d 00 38 	bgt     cr7,b98 <sfn_ioctl+0x2b4>
     b64:	81 21 00 24 	lwz     r9,36(r1)
     b68:	2f 89 00 00 	cmpwi   cr7,r9,0
     b6c:	41 9e 00 24 	beq     cr7,b90 <sfn_ioctl+0x2ac>
     b70:	81 21 00 24 	lwz     r9,36(r1)
     b74:	39 49 ff ff 	addi    r10,r9,-1
     b78:	7c 49 13 78 	mr      r9,r2
     b7c:	81 09 03 2c 	lwz     r8,812(r9)
     b80:	81 21 00 20 	lwz     r9,32(r1)
     b84:	7d 29 40 50 	subf    r9,r9,r8
     b88:	7f 8a 48 40 	cmplw   cr7,r10,r9
     b8c:	41 9d 00 0c 	bgt     cr7,b98 <sfn_ioctl+0x2b4>
     b90:	39 20 00 01 	li      r9,1
     b94:	48 00 00 08 	b       b9c <sfn_ioctl+0x2b8>
     b98:	39 20 00 00 	li      r9,0
     b9c:	2f 89 00 00 	cmpwi   cr7,r9,0
     ba0:	41 9e 00 1c 	beq     cr7,bbc <sfn_ioctl+0x2d8>
		return __copy_tofrom_user((__force void __user *)to, from, n);
     ba4:	80 61 00 1c 	lwz     r3,28(r1)
     ba8:	80 81 00 20 	lwz     r4,32(r1)
     bac:	80 a1 00 24 	lwz     r5,36(r1)
     bb0:	48 00 00 01 	bl      bb0 <sfn_ioctl+0x2cc>
     bb4:	7c 69 1b 78 	mr      r9,r3
     bb8:	48 00 00 5c 	b       c14 <sfn_ioctl+0x330>
	if ((unsigned long)from < TASK_SIZE) {
     bbc:	81 41 00 20 	lwz     r10,32(r1)
     bc0:	3d 20 bf ff 	lis     r9,-16385
     bc4:	61 29 ff ff 	ori     r9,r9,65535
     bc8:	7f 8a 48 40 	cmplw   cr7,r10,r9
     bcc:	41 9d 00 44 	bgt     cr7,c10 <sfn_ioctl+0x32c>
		over = (unsigned long)from + n - TASK_SIZE;
     bd0:	81 41 00 20 	lwz     r10,32(r1)
     bd4:	81 21 00 24 	lwz     r9,36(r1)
     bd8:	7d 2a 4a 14 	add     r9,r10,r9
     bdc:	3d 29 40 00 	addis   r9,r9,16384
     be0:	91 21 00 28 	stw     r9,40(r1)
		return __copy_tofrom_user((__force void __user *)to, from,
     be4:	81 41 00 24 	lwz     r10,36(r1)
     be8:	81 21 00 28 	lwz     r9,40(r1)
     bec:	7d 29 50 50 	subf    r9,r9,r10
     bf0:	80 61 00 1c 	lwz     r3,28(r1)
     bf4:	80 81 00 20 	lwz     r4,32(r1)
     bf8:	7d 25 4b 78 	mr      r5,r9
     bfc:	48 00 00 01 	bl      bfc <sfn_ioctl+0x318>
     c00:	7c 6a 1b 78 	mr      r10,r3
     c04:	81 21 00 28 	lwz     r9,40(r1)
     c08:	7d 2a 4a 14 	add     r9,r10,r9
     c0c:	48 00 00 08 	b       c14 <sfn_ioctl+0x330>
				n - over) + over;
	}
	return n;
     c10:	81 21 00 24 	lwz     r9,36(r1)
     c14:	2f 89 00 00 	cmpwi   cr7,r9,0
     c18:	41 9e 00 0c 	beq     cr7,c24 <sfn_ioctl+0x340>
            return -EFAULT;
     c1c:	39 20 ff f2 	li      r9,-14
     c20:	48 00 0c bc 	b       18dc <sfn_ioctl+0xff8>
        if (sfn_user_value > SFN_MAX || sfn_user_value < 0)
     c24:	3d 20 00 00 	lis     r9,0
     c28:	81 49 00 00 	lwz     r10,0(r9)
     c2c:	3d 20 00 0f 	lis     r9,15
     c30:	61 29 ff ff 	ori     r9,r9,65535
     c34:	7f 8a 48 40 	cmplw   cr7,r10,r9
     c38:	40 9d 00 0c 	ble     cr7,c44 <sfn_ioctl+0x360>
            return -EFAULT;
     c3c:	39 20 ff f2 	li      r9,-14
     c40:	48 00 0c 9c 	b       18dc <sfn_ioctl+0xff8>
#ifdef CONFIG_FSPC
        sfn_user_sync = 1;      //Syncronisation with ISR
#endif
#ifdef CONFIG_FCMD
        SFN_WRITE(sfn_number, sfn_user_value);
     c44:	3d 20 00 00 	lis     r9,0
     c48:	81 49 00 00 	lwz     r10,0(r9)
     c4c:	3d 20 00 00 	lis     r9,0
     c50:	81 29 00 00 	lwz     r9,0(r9)
     c54:	55 29 04 3e 	clrlwi  r9,r9,16
     c58:	91 41 00 2c 	stw     r10,44(r1)
     c5c:	b1 21 00 30 	sth     r9,48(r1)
     c60:	81 21 00 2c 	lwz     r9,44(r1)
     c64:	91 21 00 34 	stw     r9,52(r1)
     c68:	a1 21 00 30 	lhz     r9,48(r1)
     c6c:	b1 21 00 38 	sth     r9,56(r1)
     c70:	81 21 00 34 	lwz     r9,52(r1)
     c74:	a1 41 00 38 	lhz     r10,56(r1)
     c78:	7c 00 04 ac 	sync    
     c7c:	b1 49 00 00 	sth     r10,0(r9)
#endif
        break;
     c80:	48 00 0c 58 	b       18d8 <sfn_ioctl+0xff4>

    case SFN_SET_BCN:
        if (copy_from_user(&bcn_n1_user_value, (u64 __user*)arg, sizeof(u64)))
     c84:	81 21 01 24 	lwz     r9,292(r1)
     c88:	3d 40 00 00 	lis     r10,0
     c8c:	39 4a 00 00 	addi    r10,r10,0
     c90:	91 41 00 3c 	stw     r10,60(r1)
     c94:	91 21 00 40 	stw     r9,64(r1)
     c98:	39 20 00 08 	li      r9,8
     c9c:	91 21 00 44 	stw     r9,68(r1)
static inline unsigned long copy_from_user(void *to,
		const void __user *from, unsigned long n)
{
	unsigned long over;

	if (access_ok(VERIFY_READ, from, n))
     ca0:	81 41 00 40 	lwz     r10,64(r1)
     ca4:	7c 49 13 78 	mr      r9,r2
     ca8:	81 29 03 2c 	lwz     r9,812(r9)
     cac:	7f 8a 48 40 	cmplw   cr7,r10,r9
     cb0:	41 9d 00 38 	bgt     cr7,ce8 <sfn_ioctl+0x404>
     cb4:	81 21 00 44 	lwz     r9,68(r1)
     cb8:	2f 89 00 00 	cmpwi   cr7,r9,0
     cbc:	41 9e 00 24 	beq     cr7,ce0 <sfn_ioctl+0x3fc>
     cc0:	81 21 00 44 	lwz     r9,68(r1)
     cc4:	39 49 ff ff 	addi    r10,r9,-1
     cc8:	7c 49 13 78 	mr      r9,r2
     ccc:	81 09 03 2c 	lwz     r8,812(r9)
     cd0:	81 21 00 40 	lwz     r9,64(r1)
     cd4:	7d 29 40 50 	subf    r9,r9,r8
     cd8:	7f 8a 48 40 	cmplw   cr7,r10,r9
     cdc:	41 9d 00 0c 	bgt     cr7,ce8 <sfn_ioctl+0x404>
     ce0:	39 20 00 01 	li      r9,1
     ce4:	48 00 00 08 	b       cec <sfn_ioctl+0x408>
     ce8:	39 20 00 00 	li      r9,0
     cec:	2f 89 00 00 	cmpwi   cr7,r9,0
     cf0:	41 9e 00 1c 	beq     cr7,d0c <sfn_ioctl+0x428>
		return __copy_tofrom_user((__force void __user *)to, from, n);
     cf4:	80 61 00 3c 	lwz     r3,60(r1)
     cf8:	80 81 00 40 	lwz     r4,64(r1)
     cfc:	80 a1 00 44 	lwz     r5,68(r1)
     d00:	48 00 00 01 	bl      d00 <sfn_ioctl+0x41c>
     d04:	7c 69 1b 78 	mr      r9,r3
     d08:	48 00 00 5c 	b       d64 <sfn_ioctl+0x480>
	if ((unsigned long)from < TASK_SIZE) {
     d0c:	81 41 00 40 	lwz     r10,64(r1)
     d10:	3d 20 bf ff 	lis     r9,-16385
     d14:	61 29 ff ff 	ori     r9,r9,65535
     d18:	7f 8a 48 40 	cmplw   cr7,r10,r9
     d1c:	41 9d 00 44 	bgt     cr7,d60 <sfn_ioctl+0x47c>
		over = (unsigned long)from + n - TASK_SIZE;
     d20:	81 41 00 40 	lwz     r10,64(r1)
     d24:	81 21 00 44 	lwz     r9,68(r1)
     d28:	7d 2a 4a 14 	add     r9,r10,r9
     d2c:	3d 29 40 00 	addis   r9,r9,16384
     d30:	91 21 00 48 	stw     r9,72(r1)
		return __copy_tofrom_user((__force void __user *)to, from,
     d34:	81 41 00 44 	lwz     r10,68(r1)
     d38:	81 21 00 48 	lwz     r9,72(r1)
     d3c:	7d 29 50 50 	subf    r9,r9,r10
     d40:	80 61 00 3c 	lwz     r3,60(r1)
     d44:	80 81 00 40 	lwz     r4,64(r1)
     d48:	7d 25 4b 78 	mr      r5,r9
     d4c:	48 00 00 01 	bl      d4c <sfn_ioctl+0x468>
     d50:	7c 6a 1b 78 	mr      r10,r3
     d54:	81 21 00 48 	lwz     r9,72(r1)
     d58:	7d 2a 4a 14 	add     r9,r10,r9
     d5c:	48 00 00 08 	b       d64 <sfn_ioctl+0x480>
				n - over) + over;
	}
	return n;
     d60:	81 21 00 44 	lwz     r9,68(r1)
     d64:	2f 89 00 00 	cmpwi   cr7,r9,0
     d68:	41 9e 00 0c 	beq     cr7,d74 <sfn_ioctl+0x490>
            return -EFAULT;
     d6c:	39 20 ff f2 	li      r9,-14
     d70:	48 00 0b 6c 	b       18dc <sfn_ioctl+0xff8>
        if (bcn_n1_user_value > MAX_N1_COUNTER_VALUE)
     d74:	3d 20 00 00 	lis     r9,0
     d78:	39 29 00 00 	addi    r9,r9,0
     d7c:	81 49 00 04 	lwz     r10,4(r9)
     d80:	81 29 00 00 	lwz     r9,0(r9)
     d84:	2b 89 00 ff 	cmplwi  cr7,r9,255
     d88:	41 9d 00 44 	bgt     cr7,dcc <sfn_ioctl+0x4e8>
            return -EFAULT;
        sfn_user_value = (u32)bcn_n1_user_value & SFN_USR_VAL;
     d8c:	3d 20 00 00 	lis     r9,0
     d90:	39 29 00 00 	addi    r9,r9,0
     d94:	81 49 00 04 	lwz     r10,4(r9)
     d98:	81 29 00 00 	lwz     r9,0(r9)
     d9c:	7d 49 53 78 	mr      r9,r10
     da0:	55 2a 03 3e 	clrlwi  r10,r9,12
     da4:	3d 20 00 00 	lis     r9,0
     da8:	91 49 00 00 	stw     r10,0(r9)
#ifdef CONFIG_FCMD
        local_hsfn_update(sfn_user_value);
     dac:	3d 20 00 00 	lis     r9,0
     db0:	81 29 00 00 	lwz     r9,0(r9)
     db4:	7d 23 4b 78 	mr      r3,r9
     db8:	4b ff f3 39 	bl      f0 <local_hsfn_update>
#endif
        bcn_n1_user_sync = 1;   //Syncronisation with ISR
     dbc:	3d 20 00 00 	lis     r9,0
     dc0:	39 40 00 01 	li      r10,1
     dc4:	91 49 00 00 	stw     r10,0(r9)
        break;
     dc8:	48 00 0b 10 	b       18d8 <sfn_ioctl+0xff4>

    case SFN_SET_BCN:
        if (copy_from_user(&bcn_n1_user_value, (u64 __user*)arg, sizeof(u64)))
            return -EFAULT;
        if (bcn_n1_user_value > MAX_N1_COUNTER_VALUE)
            return -EFAULT;
     dcc:	39 20 ff f2 	li      r9,-14
     dd0:	48 00 0b 0c 	b       18dc <sfn_ioctl+0xff8>
#endif
        bcn_n1_user_sync = 1;   //Syncronisation with ISR
        break;

    case SFN_SET_BTSRTC_BCN:
        if (copy_from_user(&sfn_param, (struct sfn_data *) arg, sizeof(struct sfn_data)))
     dd4:	81 21 01 24 	lwz     r9,292(r1)
     dd8:	39 41 00 f8 	addi    r10,r1,248
     ddc:	91 41 00 4c 	stw     r10,76(r1)
     de0:	91 21 00 50 	stw     r9,80(r1)
     de4:	39 20 00 18 	li      r9,24
     de8:	91 21 00 54 	stw     r9,84(r1)
static inline unsigned long copy_from_user(void *to,
		const void __user *from, unsigned long n)
{
	unsigned long over;

	if (access_ok(VERIFY_READ, from, n))
     dec:	81 41 00 50 	lwz     r10,80(r1)
     df0:	7c 49 13 78 	mr      r9,r2
     df4:	81 29 03 2c 	lwz     r9,812(r9)
     df8:	7f 8a 48 40 	cmplw   cr7,r10,r9
     dfc:	41 9d 00 38 	bgt     cr7,e34 <sfn_ioctl+0x550>
     e00:	81 21 00 54 	lwz     r9,84(r1)
     e04:	2f 89 00 00 	cmpwi   cr7,r9,0
     e08:	41 9e 00 24 	beq     cr7,e2c <sfn_ioctl+0x548>
     e0c:	81 21 00 54 	lwz     r9,84(r1)
     e10:	39 49 ff ff 	addi    r10,r9,-1
     e14:	7c 49 13 78 	mr      r9,r2
     e18:	81 09 03 2c 	lwz     r8,812(r9)
     e1c:	81 21 00 50 	lwz     r9,80(r1)
     e20:	7d 29 40 50 	subf    r9,r9,r8
     e24:	7f 8a 48 40 	cmplw   cr7,r10,r9
     e28:	41 9d 00 0c 	bgt     cr7,e34 <sfn_ioctl+0x550>
     e2c:	39 20 00 01 	li      r9,1
     e30:	48 00 00 08 	b       e38 <sfn_ioctl+0x554>
     e34:	39 20 00 00 	li      r9,0
     e38:	2f 89 00 00 	cmpwi   cr7,r9,0
     e3c:	41 9e 00 1c 	beq     cr7,e58 <sfn_ioctl+0x574>
		return __copy_tofrom_user((__force void __user *)to, from, n);
     e40:	80 61 00 4c 	lwz     r3,76(r1)
     e44:	80 81 00 50 	lwz     r4,80(r1)
     e48:	80 a1 00 54 	lwz     r5,84(r1)
     e4c:	48 00 00 01 	bl      e4c <sfn_ioctl+0x568>
     e50:	7c 69 1b 78 	mr      r9,r3
     e54:	48 00 00 5c 	b       eb0 <sfn_ioctl+0x5cc>
	if ((unsigned long)from < TASK_SIZE) {
     e58:	81 41 00 50 	lwz     r10,80(r1)
     e5c:	3d 20 bf ff 	lis     r9,-16385
     e60:	61 29 ff ff 	ori     r9,r9,65535
     e64:	7f 8a 48 40 	cmplw   cr7,r10,r9
     e68:	41 9d 00 44 	bgt     cr7,eac <sfn_ioctl+0x5c8>
		over = (unsigned long)from + n - TASK_SIZE;
     e6c:	81 41 00 50 	lwz     r10,80(r1)
     e70:	81 21 00 54 	lwz     r9,84(r1)
     e74:	7d 2a 4a 14 	add     r9,r10,r9
     e78:	3d 29 40 00 	addis   r9,r9,16384
     e7c:	91 21 00 58 	stw     r9,88(r1)
		return __copy_tofrom_user((__force void __user *)to, from,
     e80:	81 41 00 54 	lwz     r10,84(r1)
     e84:	81 21 00 58 	lwz     r9,88(r1)
     e88:	7d 29 50 50 	subf    r9,r9,r10
     e8c:	80 61 00 4c 	lwz     r3,76(r1)
     e90:	80 81 00 50 	lwz     r4,80(r1)
     e94:	7d 25 4b 78 	mr      r5,r9
     e98:	48 00 00 01 	bl      e98 <sfn_ioctl+0x5b4>
     e9c:	7c 6a 1b 78 	mr      r10,r3
     ea0:	81 21 00 58 	lwz     r9,88(r1)
     ea4:	7d 2a 4a 14 	add     r9,r10,r9
     ea8:	48 00 00 08 	b       eb0 <sfn_ioctl+0x5cc>
				n - over) + over;
	}
	return n;
     eac:	81 21 00 54 	lwz     r9,84(r1)
     eb0:	2f 89 00 00 	cmpwi   cr7,r9,0
     eb4:	41 9e 00 0c 	beq     cr7,ec0 <sfn_ioctl+0x5dc>
            return -EFAULT;
     eb8:	39 20 ff f2 	li      r9,-14
     ebc:	48 00 0a 20 	b       18dc <sfn_ioctl+0xff8>
        if (sfn_param.bcn_n1 > MAX_N1_COUNTER_VALUE)
     ec0:	81 21 01 00 	lwz     r9,256(r1)
     ec4:	81 41 01 04 	lwz     r10,260(r1)
     ec8:	2b 89 00 ff 	cmplwi  cr7,r9,255
     ecc:	41 9d 00 a0 	bgt     cr7,f6c <sfn_ioctl+0x688>
            return -EFAULT;
        bts_rtc_user_value = sfn_param; /* bts_rtc_value is global variable (set BTS RTC in ISR) */
     ed0:	3d 20 00 00 	lis     r9,0
     ed4:	39 29 00 00 	addi    r9,r9,0
     ed8:	80 c1 00 f8 	lwz     r6,248(r1)
     edc:	80 e1 00 fc 	lwz     r7,252(r1)
     ee0:	81 01 01 00 	lwz     r8,256(r1)
     ee4:	81 41 01 04 	lwz     r10,260(r1)
     ee8:	90 c9 00 00 	stw     r6,0(r9)
     eec:	90 e9 00 04 	stw     r7,4(r9)
     ef0:	91 09 00 08 	stw     r8,8(r9)
     ef4:	91 49 00 0c 	stw     r10,12(r9)
     ef8:	81 01 01 08 	lwz     r8,264(r1)
     efc:	81 41 01 0c 	lwz     r10,268(r1)
     f00:	91 09 00 10 	stw     r8,16(r9)
     f04:	91 49 00 14 	stw     r10,20(r9)
        bcn_n1_user_value = sfn_param.bcn_n1;
     f08:	81 21 01 00 	lwz     r9,256(r1)
     f0c:	81 41 01 04 	lwz     r10,260(r1)
     f10:	3d 00 00 00 	lis     r8,0
     f14:	39 08 00 00 	addi    r8,r8,0
     f18:	91 28 00 00 	stw     r9,0(r8)
     f1c:	91 48 00 04 	stw     r10,4(r8)
        sfn_user_value = (u32)bcn_n1_user_value & SFN_USR_VAL;
     f20:	3d 20 00 00 	lis     r9,0
     f24:	39 29 00 00 	addi    r9,r9,0
     f28:	81 49 00 04 	lwz     r10,4(r9)
     f2c:	81 29 00 00 	lwz     r9,0(r9)
     f30:	7d 49 53 78 	mr      r9,r10
     f34:	55 2a 03 3e 	clrlwi  r10,r9,12
     f38:	3d 20 00 00 	lis     r9,0
     f3c:	91 49 00 00 	stw     r10,0(r9)
#ifdef CONFIG_FCMD
        local_hsfn_update(sfn_user_value);
     f40:	3d 20 00 00 	lis     r9,0
     f44:	81 29 00 00 	lwz     r9,0(r9)
     f48:	7d 23 4b 78 	mr      r3,r9
     f4c:	4b ff f1 a5 	bl      f0 <local_hsfn_update>
#endif
        bcn_n1_user_sync = 1;   //Syncronisation with ISR
     f50:	3d 20 00 00 	lis     r9,0
     f54:	39 40 00 01 	li      r10,1
     f58:	91 49 00 00 	stw     r10,0(r9)
        bts_rtc_sync = 1;       //Trigger syncronisation in ISR
     f5c:	3d 20 00 00 	lis     r9,0
     f60:	39 40 00 01 	li      r10,1
     f64:	91 49 00 00 	stw     r10,0(r9)
        break;
     f68:	48 00 09 70 	b       18d8 <sfn_ioctl+0xff4>

    case SFN_SET_BTSRTC_BCN:
        if (copy_from_user(&sfn_param, (struct sfn_data *) arg, sizeof(struct sfn_data)))
            return -EFAULT;
        if (sfn_param.bcn_n1 > MAX_N1_COUNTER_VALUE)
            return -EFAULT;
     f6c:	39 20 ff f2 	li      r9,-14
     f70:	48 00 09 6c 	b       18dc <sfn_ioctl+0xff8>
        bts_rtc_sync = 1;       //Trigger syncronisation in ISR
        break;

    case SFN_GET:
#ifdef CONFIG_FCMD
        local_hsfn_update(local_hsfn);
     f74:	3d 20 00 00 	lis     r9,0
     f78:	81 29 00 00 	lwz     r9,0(r9)
     f7c:	7d 23 4b 78 	mr      r3,r9
     f80:	4b ff f1 71 	bl      f0 <local_hsfn_update>
#endif
        sfn_param.sfn = local_hsfn;             //write SFN
     f84:	3d 20 00 00 	lis     r9,0
     f88:	81 29 00 00 	lwz     r9,0(r9)
     f8c:	91 21 00 f8 	stw     r9,248(r1)
        sfn_param.timestamp = timestamp;        //write system time
     f90:	3d 20 00 00 	lis     r9,0
     f94:	39 29 00 00 	addi    r9,r9,0
     f98:	81 49 00 00 	lwz     r10,0(r9)
     f9c:	81 29 00 04 	lwz     r9,4(r9)
     fa0:	91 41 01 08 	stw     r10,264(r1)
     fa4:	91 21 01 0c 	stw     r9,268(r1)
        if (copy_to_user((struct sfn_data *)arg, &sfn_param, sizeof(struct sfn_data)))
     fa8:	81 21 01 24 	lwz     r9,292(r1)
     fac:	91 21 00 5c 	stw     r9,92(r1)
     fb0:	39 21 00 f8 	addi    r9,r1,248
     fb4:	91 21 00 60 	stw     r9,96(r1)
     fb8:	39 20 00 18 	li      r9,24
     fbc:	91 21 00 64 	stw     r9,100(r1)
static inline unsigned long copy_to_user(void __user *to,
		const void *from, unsigned long n)
{
	unsigned long over;

	if (access_ok(VERIFY_WRITE, to, n))
     fc0:	81 41 00 5c 	lwz     r10,92(r1)
     fc4:	7c 49 13 78 	mr      r9,r2
     fc8:	81 29 03 2c 	lwz     r9,812(r9)
     fcc:	7f 8a 48 40 	cmplw   cr7,r10,r9
     fd0:	41 9d 00 38 	bgt     cr7,1008 <sfn_ioctl+0x724>
     fd4:	81 21 00 64 	lwz     r9,100(r1)
     fd8:	2f 89 00 00 	cmpwi   cr7,r9,0
     fdc:	41 9e 00 24 	beq     cr7,1000 <sfn_ioctl+0x71c>
     fe0:	81 21 00 64 	lwz     r9,100(r1)
     fe4:	39 49 ff ff 	addi    r10,r9,-1
     fe8:	7c 49 13 78 	mr      r9,r2
     fec:	81 09 03 2c 	lwz     r8,812(r9)
     ff0:	81 21 00 5c 	lwz     r9,92(r1)
     ff4:	7d 29 40 50 	subf    r9,r9,r8
     ff8:	7f 8a 48 40 	cmplw   cr7,r10,r9
     ffc:	41 9d 00 0c 	bgt     cr7,1008 <sfn_ioctl+0x724>
    1000:	39 20 00 01 	li      r9,1
    1004:	48 00 00 08 	b       100c <sfn_ioctl+0x728>
    1008:	39 20 00 00 	li      r9,0
    100c:	2f 89 00 00 	cmpwi   cr7,r9,0
    1010:	41 9e 00 1c 	beq     cr7,102c <sfn_ioctl+0x748>
		return __copy_tofrom_user(to, (__force void __user *)from, n);
    1014:	80 61 00 5c 	lwz     r3,92(r1)
    1018:	80 81 00 60 	lwz     r4,96(r1)
    101c:	80 a1 00 64 	lwz     r5,100(r1)
    1020:	48 00 00 01 	bl      1020 <sfn_ioctl+0x73c>
    1024:	7c 69 1b 78 	mr      r9,r3
    1028:	48 00 00 5c 	b       1084 <sfn_ioctl+0x7a0>
	if ((unsigned long)to < TASK_SIZE) {
    102c:	81 41 00 5c 	lwz     r10,92(r1)
    1030:	3d 20 bf ff 	lis     r9,-16385
    1034:	61 29 ff ff 	ori     r9,r9,65535
    1038:	7f 8a 48 40 	cmplw   cr7,r10,r9
    103c:	41 9d 00 44 	bgt     cr7,1080 <sfn_ioctl+0x79c>
		over = (unsigned long)to + n - TASK_SIZE;
    1040:	81 41 00 5c 	lwz     r10,92(r1)
    1044:	81 21 00 64 	lwz     r9,100(r1)
    1048:	7d 2a 4a 14 	add     r9,r10,r9
    104c:	3d 29 40 00 	addis   r9,r9,16384
    1050:	91 21 00 68 	stw     r9,104(r1)
		return __copy_tofrom_user(to, (__force void __user *)from,
    1054:	81 41 00 64 	lwz     r10,100(r1)
    1058:	81 21 00 68 	lwz     r9,104(r1)
    105c:	7d 29 50 50 	subf    r9,r9,r10
    1060:	80 61 00 5c 	lwz     r3,92(r1)
    1064:	80 81 00 60 	lwz     r4,96(r1)
    1068:	7d 25 4b 78 	mr      r5,r9
    106c:	48 00 00 01 	bl      106c <sfn_ioctl+0x788>
    1070:	7c 6a 1b 78 	mr      r10,r3
    1074:	81 21 00 68 	lwz     r9,104(r1)
    1078:	7d 2a 4a 14 	add     r9,r10,r9
    107c:	48 00 00 08 	b       1084 <sfn_ioctl+0x7a0>
				n - over) + over;
	}
	return n;
    1080:	81 21 00 64 	lwz     r9,100(r1)
    1084:	2f 89 00 00 	cmpwi   cr7,r9,0
    1088:	41 9e 08 2c 	beq     cr7,18b4 <sfn_ioctl+0xfd0>
            return -EFAULT;
    108c:	39 20 ff f2 	li      r9,-14
    1090:	48 00 08 4c 	b       18dc <sfn_ioctl+0xff8>
        break;

    case SFN_GET_BCN:
        if (copy_to_user((uint64_t *)arg, &bcn_n1, sizeof(uint64_t)))
    1094:	81 21 01 24 	lwz     r9,292(r1)
    1098:	91 21 00 6c 	stw     r9,108(r1)
    109c:	3d 20 00 00 	lis     r9,0
    10a0:	39 29 00 00 	addi    r9,r9,0
    10a4:	91 21 00 70 	stw     r9,112(r1)
    10a8:	39 20 00 08 	li      r9,8
    10ac:	91 21 00 74 	stw     r9,116(r1)
static inline unsigned long copy_to_user(void __user *to,
		const void *from, unsigned long n)
{
	unsigned long over;

	if (access_ok(VERIFY_WRITE, to, n))
    10b0:	81 41 00 6c 	lwz     r10,108(r1)
    10b4:	7c 49 13 78 	mr      r9,r2
    10b8:	81 29 03 2c 	lwz     r9,812(r9)
    10bc:	7f 8a 48 40 	cmplw   cr7,r10,r9
    10c0:	41 9d 00 38 	bgt     cr7,10f8 <sfn_ioctl+0x814>
    10c4:	81 21 00 74 	lwz     r9,116(r1)
    10c8:	2f 89 00 00 	cmpwi   cr7,r9,0
    10cc:	41 9e 00 24 	beq     cr7,10f0 <sfn_ioctl+0x80c>
    10d0:	81 21 00 74 	lwz     r9,116(r1)
    10d4:	39 49 ff ff 	addi    r10,r9,-1
    10d8:	7c 49 13 78 	mr      r9,r2
    10dc:	81 09 03 2c 	lwz     r8,812(r9)
    10e0:	81 21 00 6c 	lwz     r9,108(r1)
    10e4:	7d 29 40 50 	subf    r9,r9,r8
    10e8:	7f 8a 48 40 	cmplw   cr7,r10,r9
    10ec:	41 9d 00 0c 	bgt     cr7,10f8 <sfn_ioctl+0x814>
    10f0:	39 20 00 01 	li      r9,1
    10f4:	48 00 00 08 	b       10fc <sfn_ioctl+0x818>
    10f8:	39 20 00 00 	li      r9,0
    10fc:	2f 89 00 00 	cmpwi   cr7,r9,0
    1100:	41 9e 00 1c 	beq     cr7,111c <sfn_ioctl+0x838>
		return __copy_tofrom_user(to, (__force void __user *)from, n);
    1104:	80 61 00 6c 	lwz     r3,108(r1)
    1108:	80 81 00 70 	lwz     r4,112(r1)
    110c:	80 a1 00 74 	lwz     r5,116(r1)
    1110:	48 00 00 01 	bl      1110 <sfn_ioctl+0x82c>
    1114:	7c 69 1b 78 	mr      r9,r3
    1118:	48 00 00 5c 	b       1174 <sfn_ioctl+0x890>
	if ((unsigned long)to < TASK_SIZE) {
    111c:	81 41 00 6c 	lwz     r10,108(r1)
    1120:	3d 20 bf ff 	lis     r9,-16385
    1124:	61 29 ff ff 	ori     r9,r9,65535
    1128:	7f 8a 48 40 	cmplw   cr7,r10,r9
    112c:	41 9d 00 44 	bgt     cr7,1170 <sfn_ioctl+0x88c>
		over = (unsigned long)to + n - TASK_SIZE;
    1130:	81 41 00 6c 	lwz     r10,108(r1)
    1134:	81 21 00 74 	lwz     r9,116(r1)
    1138:	7d 2a 4a 14 	add     r9,r10,r9
    113c:	3d 29 40 00 	addis   r9,r9,16384
    1140:	91 21 00 78 	stw     r9,120(r1)
		return __copy_tofrom_user(to, (__force void __user *)from,
    1144:	81 41 00 74 	lwz     r10,116(r1)
    1148:	81 21 00 78 	lwz     r9,120(r1)
    114c:	7d 29 50 50 	subf    r9,r9,r10
    1150:	80 61 00 6c 	lwz     r3,108(r1)
    1154:	80 81 00 70 	lwz     r4,112(r1)
    1158:	7d 25 4b 78 	mr      r5,r9
    115c:	48 00 00 01 	bl      115c <sfn_ioctl+0x878>
    1160:	7c 6a 1b 78 	mr      r10,r3
    1164:	81 21 00 78 	lwz     r9,120(r1)
    1168:	7d 2a 4a 14 	add     r9,r10,r9
    116c:	48 00 00 08 	b       1174 <sfn_ioctl+0x890>
				n - over) + over;
	}
	return n;
    1170:	81 21 00 74 	lwz     r9,116(r1)
    1174:	2f 89 00 00 	cmpwi   cr7,r9,0
    1178:	41 9e 07 44 	beq     cr7,18bc <sfn_ioctl+0xfd8>
            return -EFAULT;
    117c:	39 20 ff f2 	li      r9,-14
    1180:	48 00 07 5c 	b       18dc <sfn_ioctl+0xff8>
        break;

    case SFN_GET_BTSRTC_BCN:
        calculate_current_bts_rtc(&bts_rtc_value);
    1184:	3d 20 00 00 	lis     r9,0
    1188:	38 69 00 00 	addi    r3,r9,0
    118c:	4b ff f3 f1 	bl      57c <calculate_current_bts_rtc>
        if (copy_to_user((struct sfn_data *)arg, &bts_rtc_value, sizeof(struct sfn_data)))
    1190:	81 21 01 24 	lwz     r9,292(r1)
    1194:	91 21 00 7c 	stw     r9,124(r1)
    1198:	3d 20 00 00 	lis     r9,0
    119c:	39 29 00 00 	addi    r9,r9,0
    11a0:	91 21 00 80 	stw     r9,128(r1)
    11a4:	39 20 00 18 	li      r9,24
    11a8:	91 21 00 84 	stw     r9,132(r1)
static inline unsigned long copy_to_user(void __user *to,
		const void *from, unsigned long n)
{
	unsigned long over;

	if (access_ok(VERIFY_WRITE, to, n))
    11ac:	81 41 00 7c 	lwz     r10,124(r1)
    11b0:	7c 49 13 78 	mr      r9,r2
    11b4:	81 29 03 2c 	lwz     r9,812(r9)
    11b8:	7f 8a 48 40 	cmplw   cr7,r10,r9
    11bc:	41 9d 00 38 	bgt     cr7,11f4 <sfn_ioctl+0x910>
    11c0:	81 21 00 84 	lwz     r9,132(r1)
    11c4:	2f 89 00 00 	cmpwi   cr7,r9,0
    11c8:	41 9e 00 24 	beq     cr7,11ec <sfn_ioctl+0x908>
    11cc:	81 21 00 84 	lwz     r9,132(r1)
    11d0:	39 49 ff ff 	addi    r10,r9,-1
    11d4:	7c 49 13 78 	mr      r9,r2
    11d8:	81 09 03 2c 	lwz     r8,812(r9)
    11dc:	81 21 00 7c 	lwz     r9,124(r1)
    11e0:	7d 29 40 50 	subf    r9,r9,r8
    11e4:	7f 8a 48 40 	cmplw   cr7,r10,r9
    11e8:	41 9d 00 0c 	bgt     cr7,11f4 <sfn_ioctl+0x910>
    11ec:	39 20 00 01 	li      r9,1
    11f0:	48 00 00 08 	b       11f8 <sfn_ioctl+0x914>
    11f4:	39 20 00 00 	li      r9,0
    11f8:	2f 89 00 00 	cmpwi   cr7,r9,0
    11fc:	41 9e 00 1c 	beq     cr7,1218 <sfn_ioctl+0x934>
		return __copy_tofrom_user(to, (__force void __user *)from, n);
    1200:	80 61 00 7c 	lwz     r3,124(r1)
    1204:	80 81 00 80 	lwz     r4,128(r1)
    1208:	80 a1 00 84 	lwz     r5,132(r1)
    120c:	48 00 00 01 	bl      120c <sfn_ioctl+0x928>
    1210:	7c 69 1b 78 	mr      r9,r3
    1214:	48 00 00 5c 	b       1270 <sfn_ioctl+0x98c>
	if ((unsigned long)to < TASK_SIZE) {
    1218:	81 41 00 7c 	lwz     r10,124(r1)
    121c:	3d 20 bf ff 	lis     r9,-16385
    1220:	61 29 ff ff 	ori     r9,r9,65535
    1224:	7f 8a 48 40 	cmplw   cr7,r10,r9
    1228:	41 9d 00 44 	bgt     cr7,126c <sfn_ioctl+0x988>
		over = (unsigned long)to + n - TASK_SIZE;
    122c:	81 41 00 7c 	lwz     r10,124(r1)
    1230:	81 21 00 84 	lwz     r9,132(r1)
    1234:	7d 2a 4a 14 	add     r9,r10,r9
    1238:	3d 29 40 00 	addis   r9,r9,16384
    123c:	91 21 00 88 	stw     r9,136(r1)
		return __copy_tofrom_user(to, (__force void __user *)from,
    1240:	81 41 00 84 	lwz     r10,132(r1)
    1244:	81 21 00 88 	lwz     r9,136(r1)
    1248:	7d 29 50 50 	subf    r9,r9,r10
    124c:	80 61 00 7c 	lwz     r3,124(r1)
    1250:	80 81 00 80 	lwz     r4,128(r1)
    1254:	7d 25 4b 78 	mr      r5,r9
    1258:	48 00 00 01 	bl      1258 <sfn_ioctl+0x974>
    125c:	7c 6a 1b 78 	mr      r10,r3
    1260:	81 21 00 88 	lwz     r9,136(r1)
    1264:	7d 2a 4a 14 	add     r9,r10,r9
    1268:	48 00 00 08 	b       1270 <sfn_ioctl+0x98c>
				n - over) + over;
	}
	return n;
    126c:	81 21 00 84 	lwz     r9,132(r1)
    1270:	2f 89 00 00 	cmpwi   cr7,r9,0
    1274:	41 9e 06 50 	beq     cr7,18c4 <sfn_ioctl+0xfe0>
            return -EFAULT;
    1278:	39 20 ff f2 	li      r9,-14
    127c:	48 00 06 60 	b       18dc <sfn_ioctl+0xff8>
        break;

    case SFN_WAIT_NEXT:
        interruptible_sleep_on(&sfn_next_queue);        //Wakeup by ISR
    1280:	3d 20 00 00 	lis     r9,0
    1284:	38 69 00 00 	addi    r3,r9,0
    1288:	48 00 00 01 	bl      1288 <sfn_ioctl+0x9a4>
#ifdef CONFIG_FCMD
        local_hsfn_update(local_hsfn);
    128c:	3d 20 00 00 	lis     r9,0
    1290:	81 29 00 00 	lwz     r9,0(r9)
    1294:	7d 23 4b 78 	mr      r3,r9
    1298:	4b ff ee 59 	bl      f0 <local_hsfn_update>
#endif
        sfn_param.sfn = local_hsfn;             //write current SFN
    129c:	3d 20 00 00 	lis     r9,0
    12a0:	81 29 00 00 	lwz     r9,0(r9)
    12a4:	91 21 00 f8 	stw     r9,248(r1)
        sfn_param.timestamp = timestamp;        //write current system time
    12a8:	3d 20 00 00 	lis     r9,0
    12ac:	39 29 00 00 	addi    r9,r9,0
    12b0:	81 49 00 00 	lwz     r10,0(r9)
    12b4:	81 29 00 04 	lwz     r9,4(r9)
    12b8:	91 41 01 08 	stw     r10,264(r1)
    12bc:	91 21 01 0c 	stw     r9,268(r1)
        sfn_param.bcn_n1 = bcn_n1;              //write current BCN N1
    12c0:	3d 20 00 00 	lis     r9,0
    12c4:	39 29 00 00 	addi    r9,r9,0
    12c8:	81 49 00 04 	lwz     r10,4(r9)
    12cc:	81 29 00 00 	lwz     r9,0(r9)
    12d0:	91 21 01 00 	stw     r9,256(r1)
    12d4:	91 41 01 04 	stw     r10,260(r1)
        if (copy_to_user((struct sfn_data *)arg, &sfn_param, sizeof(struct sfn_data)))
    12d8:	81 21 01 24 	lwz     r9,292(r1)
    12dc:	91 21 00 8c 	stw     r9,140(r1)
    12e0:	39 21 00 f8 	addi    r9,r1,248
    12e4:	91 21 00 90 	stw     r9,144(r1)
    12e8:	39 20 00 18 	li      r9,24
    12ec:	91 21 00 94 	stw     r9,148(r1)
static inline unsigned long copy_to_user(void __user *to,
		const void *from, unsigned long n)
{
	unsigned long over;

	if (access_ok(VERIFY_WRITE, to, n))
    12f0:	81 41 00 8c 	lwz     r10,140(r1)
    12f4:	7c 49 13 78 	mr      r9,r2
    12f8:	81 29 03 2c 	lwz     r9,812(r9)
    12fc:	7f 8a 48 40 	cmplw   cr7,r10,r9
    1300:	41 9d 00 38 	bgt     cr7,1338 <sfn_ioctl+0xa54>
    1304:	81 21 00 94 	lwz     r9,148(r1)
    1308:	2f 89 00 00 	cmpwi   cr7,r9,0
    130c:	41 9e 00 24 	beq     cr7,1330 <sfn_ioctl+0xa4c>
    1310:	81 21 00 94 	lwz     r9,148(r1)
    1314:	39 49 ff ff 	addi    r10,r9,-1
    1318:	7c 49 13 78 	mr      r9,r2
    131c:	81 09 03 2c 	lwz     r8,812(r9)
    1320:	81 21 00 8c 	lwz     r9,140(r1)
    1324:	7d 29 40 50 	subf    r9,r9,r8
    1328:	7f 8a 48 40 	cmplw   cr7,r10,r9
    132c:	41 9d 00 0c 	bgt     cr7,1338 <sfn_ioctl+0xa54>
    1330:	39 20 00 01 	li      r9,1
    1334:	48 00 00 08 	b       133c <sfn_ioctl+0xa58>
    1338:	39 20 00 00 	li      r9,0
    133c:	2f 89 00 00 	cmpwi   cr7,r9,0
    1340:	41 9e 00 1c 	beq     cr7,135c <sfn_ioctl+0xa78>
		return __copy_tofrom_user(to, (__force void __user *)from, n);
    1344:	80 61 00 8c 	lwz     r3,140(r1)
    1348:	80 81 00 90 	lwz     r4,144(r1)
    134c:	80 a1 00 94 	lwz     r5,148(r1)
    1350:	48 00 00 01 	bl      1350 <sfn_ioctl+0xa6c>
    1354:	7c 69 1b 78 	mr      r9,r3
    1358:	48 00 00 5c 	b       13b4 <sfn_ioctl+0xad0>
	if ((unsigned long)to < TASK_SIZE) {
    135c:	81 41 00 8c 	lwz     r10,140(r1)
    1360:	3d 20 bf ff 	lis     r9,-16385
    1364:	61 29 ff ff 	ori     r9,r9,65535
    1368:	7f 8a 48 40 	cmplw   cr7,r10,r9
    136c:	41 9d 00 44 	bgt     cr7,13b0 <sfn_ioctl+0xacc>
		over = (unsigned long)to + n - TASK_SIZE;
    1370:	81 41 00 8c 	lwz     r10,140(r1)
    1374:	81 21 00 94 	lwz     r9,148(r1)
    1378:	7d 2a 4a 14 	add     r9,r10,r9
    137c:	3d 29 40 00 	addis   r9,r9,16384
    1380:	91 21 00 98 	stw     r9,152(r1)
		return __copy_tofrom_user(to, (__force void __user *)from,
    1384:	81 41 00 94 	lwz     r10,148(r1)
    1388:	81 21 00 98 	lwz     r9,152(r1)
    138c:	7d 29 50 50 	subf    r9,r9,r10
    1390:	80 61 00 8c 	lwz     r3,140(r1)
    1394:	80 81 00 90 	lwz     r4,144(r1)
    1398:	7d 25 4b 78 	mr      r5,r9
    139c:	48 00 00 01 	bl      139c <sfn_ioctl+0xab8>
    13a0:	7c 6a 1b 78 	mr      r10,r3
    13a4:	81 21 00 98 	lwz     r9,152(r1)
    13a8:	7d 2a 4a 14 	add     r9,r10,r9
    13ac:	48 00 00 08 	b       13b4 <sfn_ioctl+0xad0>
				n - over) + over;
	}
	return n;
    13b0:	81 21 00 94 	lwz     r9,148(r1)
    13b4:	2f 89 00 00 	cmpwi   cr7,r9,0
    13b8:	41 9e 05 14 	beq     cr7,18cc <sfn_ioctl+0xfe8>
            return -EFAULT;
    13bc:	39 20 ff f2 	li      r9,-14
    13c0:	48 00 05 1c 	b       18dc <sfn_ioctl+0xff8>
        break;

    case SFN_WAIT_BTSRTC_BCN:
        interruptible_sleep_on(&sfn_next_queue);    //Wakeup by ISR
    13c4:	3d 20 00 00 	lis     r9,0
    13c8:	38 69 00 00 	addi    r3,r9,0
    13cc:	48 00 00 01 	bl      13cc <sfn_ioctl+0xae8>
        calculate_current_bts_rtc(&bts_rtc_value);
    13d0:	3d 20 00 00 	lis     r9,0
    13d4:	38 69 00 00 	addi    r3,r9,0
    13d8:	4b ff f1 a5 	bl      57c <calculate_current_bts_rtc>
        if (copy_to_user((struct sfn_data *)arg, &bts_rtc_value, sizeof(struct sfn_data)))
    13dc:	81 21 01 24 	lwz     r9,292(r1)
    13e0:	91 21 00 9c 	stw     r9,156(r1)
    13e4:	3d 20 00 00 	lis     r9,0
    13e8:	39 29 00 00 	addi    r9,r9,0
    13ec:	91 21 00 a0 	stw     r9,160(r1)
    13f0:	39 20 00 18 	li      r9,24
    13f4:	91 21 00 a4 	stw     r9,164(r1)
static inline unsigned long copy_to_user(void __user *to,
		const void *from, unsigned long n)
{
	unsigned long over;

	if (access_ok(VERIFY_WRITE, to, n))
    13f8:	81 41 00 9c 	lwz     r10,156(r1)
    13fc:	7c 49 13 78 	mr      r9,r2
    1400:	81 29 03 2c 	lwz     r9,812(r9)
    1404:	7f 8a 48 40 	cmplw   cr7,r10,r9
    1408:	41 9d 00 38 	bgt     cr7,1440 <sfn_ioctl+0xb5c>
    140c:	81 21 00 a4 	lwz     r9,164(r1)
    1410:	2f 89 00 00 	cmpwi   cr7,r9,0
    1414:	41 9e 00 24 	beq     cr7,1438 <sfn_ioctl+0xb54>
    1418:	81 21 00 a4 	lwz     r9,164(r1)
    141c:	39 49 ff ff 	addi    r10,r9,-1
    1420:	7c 49 13 78 	mr      r9,r2
    1424:	81 09 03 2c 	lwz     r8,812(r9)
    1428:	81 21 00 9c 	lwz     r9,156(r1)
    142c:	7d 29 40 50 	subf    r9,r9,r8
    1430:	7f 8a 48 40 	cmplw   cr7,r10,r9
    1434:	41 9d 00 0c 	bgt     cr7,1440 <sfn_ioctl+0xb5c>
    1438:	39 20 00 01 	li      r9,1
    143c:	48 00 00 08 	b       1444 <sfn_ioctl+0xb60>
    1440:	39 20 00 00 	li      r9,0
    1444:	2f 89 00 00 	cmpwi   cr7,r9,0
    1448:	41 9e 00 1c 	beq     cr7,1464 <sfn_ioctl+0xb80>
		return __copy_tofrom_user(to, (__force void __user *)from, n);
    144c:	80 61 00 9c 	lwz     r3,156(r1)
    1450:	80 81 00 a0 	lwz     r4,160(r1)
    1454:	80 a1 00 a4 	lwz     r5,164(r1)
    1458:	48 00 00 01 	bl      1458 <sfn_ioctl+0xb74>
    145c:	7c 69 1b 78 	mr      r9,r3
    1460:	48 00 00 5c 	b       14bc <sfn_ioctl+0xbd8>
	if ((unsigned long)to < TASK_SIZE) {
    1464:	81 41 00 9c 	lwz     r10,156(r1)
    1468:	3d 20 bf ff 	lis     r9,-16385
    146c:	61 29 ff ff 	ori     r9,r9,65535
    1470:	7f 8a 48 40 	cmplw   cr7,r10,r9
    1474:	41 9d 00 44 	bgt     cr7,14b8 <sfn_ioctl+0xbd4>
		over = (unsigned long)to + n - TASK_SIZE;
    1478:	81 41 00 9c 	lwz     r10,156(r1)
    147c:	81 21 00 a4 	lwz     r9,164(r1)
    1480:	7d 2a 4a 14 	add     r9,r10,r9
    1484:	3d 29 40 00 	addis   r9,r9,16384
    1488:	91 21 00 a8 	stw     r9,168(r1)
		return __copy_tofrom_user(to, (__force void __user *)from,
    148c:	81 41 00 a4 	lwz     r10,164(r1)
    1490:	81 21 00 a8 	lwz     r9,168(r1)
    1494:	7d 29 50 50 	subf    r9,r9,r10
    1498:	80 61 00 9c 	lwz     r3,156(r1)
    149c:	80 81 00 a0 	lwz     r4,160(r1)
    14a0:	7d 25 4b 78 	mr      r5,r9
    14a4:	48 00 00 01 	bl      14a4 <sfn_ioctl+0xbc0>
    14a8:	7c 6a 1b 78 	mr      r10,r3
    14ac:	81 21 00 a8 	lwz     r9,168(r1)
    14b0:	7d 2a 4a 14 	add     r9,r10,r9
    14b4:	48 00 00 08 	b       14bc <sfn_ioctl+0xbd8>
				n - over) + over;
	}
	return n;
    14b8:	81 21 00 a4 	lwz     r9,164(r1)
    14bc:	2f 89 00 00 	cmpwi   cr7,r9,0
    14c0:	41 9e 04 14 	beq     cr7,18d4 <sfn_ioctl+0xff0>
            return -EFAULT;
    14c4:	39 20 ff f2 	li      r9,-14
    14c8:	48 00 04 14 	b       18dc <sfn_ioctl+0xff8>
        break;

    case SFN_WAIT_SPECIFIC:
        if (copy_from_user(&value_tmp, (u32 *) arg, sizeof(u32)))        //Copy from user the SFN
    14cc:	81 21 01 24 	lwz     r9,292(r1)
    14d0:	39 41 01 10 	addi    r10,r1,272
    14d4:	91 41 00 ac 	stw     r10,172(r1)
    14d8:	91 21 00 b0 	stw     r9,176(r1)
    14dc:	39 20 00 04 	li      r9,4
    14e0:	91 21 00 b4 	stw     r9,180(r1)
static inline unsigned long copy_from_user(void *to,
		const void __user *from, unsigned long n)
{
	unsigned long over;

	if (access_ok(VERIFY_READ, from, n))
    14e4:	81 41 00 b0 	lwz     r10,176(r1)
    14e8:	7c 49 13 78 	mr      r9,r2
    14ec:	81 29 03 2c 	lwz     r9,812(r9)
    14f0:	7f 8a 48 40 	cmplw   cr7,r10,r9
    14f4:	41 9d 00 38 	bgt     cr7,152c <sfn_ioctl+0xc48>
    14f8:	81 21 00 b4 	lwz     r9,180(r1)
    14fc:	2f 89 00 00 	cmpwi   cr7,r9,0
    1500:	41 9e 00 24 	beq     cr7,1524 <sfn_ioctl+0xc40>
    1504:	81 21 00 b4 	lwz     r9,180(r1)
    1508:	39 49 ff ff 	addi    r10,r9,-1
    150c:	7c 49 13 78 	mr      r9,r2
    1510:	81 09 03 2c 	lwz     r8,812(r9)
    1514:	81 21 00 b0 	lwz     r9,176(r1)
    1518:	7d 29 40 50 	subf    r9,r9,r8
    151c:	7f 8a 48 40 	cmplw   cr7,r10,r9
    1520:	41 9d 00 0c 	bgt     cr7,152c <sfn_ioctl+0xc48>
    1524:	39 20 00 01 	li      r9,1
    1528:	48 00 00 08 	b       1530 <sfn_ioctl+0xc4c>
    152c:	39 20 00 00 	li      r9,0
    1530:	2f 89 00 00 	cmpwi   cr7,r9,0
    1534:	41 9e 00 1c 	beq     cr7,1550 <sfn_ioctl+0xc6c>
		return __copy_tofrom_user((__force void __user *)to, from, n);
    1538:	80 61 00 ac 	lwz     r3,172(r1)
    153c:	80 81 00 b0 	lwz     r4,176(r1)
    1540:	80 a1 00 b4 	lwz     r5,180(r1)
    1544:	48 00 00 01 	bl      1544 <sfn_ioctl+0xc60>
    1548:	7c 69 1b 78 	mr      r9,r3
    154c:	48 00 00 5c 	b       15a8 <sfn_ioctl+0xcc4>
	if ((unsigned long)from < TASK_SIZE) {
    1550:	81 41 00 b0 	lwz     r10,176(r1)
    1554:	3d 20 bf ff 	lis     r9,-16385
    1558:	61 29 ff ff 	ori     r9,r9,65535
    155c:	7f 8a 48 40 	cmplw   cr7,r10,r9
    1560:	41 9d 00 44 	bgt     cr7,15a4 <sfn_ioctl+0xcc0>
		over = (unsigned long)from + n - TASK_SIZE;
    1564:	81 41 00 b0 	lwz     r10,176(r1)
    1568:	81 21 00 b4 	lwz     r9,180(r1)
    156c:	7d 2a 4a 14 	add     r9,r10,r9
    1570:	3d 29 40 00 	addis   r9,r9,16384
    1574:	91 21 00 b8 	stw     r9,184(r1)
		return __copy_tofrom_user((__force void __user *)to, from,
    1578:	81 41 00 b4 	lwz     r10,180(r1)
    157c:	81 21 00 b8 	lwz     r9,184(r1)
    1580:	7d 29 50 50 	subf    r9,r9,r10
    1584:	80 61 00 ac 	lwz     r3,172(r1)
    1588:	80 81 00 b0 	lwz     r4,176(r1)
    158c:	7d 25 4b 78 	mr      r5,r9
    1590:	48 00 00 01 	bl      1590 <sfn_ioctl+0xcac>
    1594:	7c 6a 1b 78 	mr      r10,r3
    1598:	81 21 00 b8 	lwz     r9,184(r1)
    159c:	7d 2a 4a 14 	add     r9,r10,r9
    15a0:	48 00 00 08 	b       15a8 <sfn_ioctl+0xcc4>
				n - over) + over;
	}
	return n;
    15a4:	81 21 00 b4 	lwz     r9,180(r1)
    15a8:	2f 89 00 00 	cmpwi   cr7,r9,0
    15ac:	41 9e 00 0c 	beq     cr7,15b8 <sfn_ioctl+0xcd4>
            return -EFAULT;
    15b0:	39 20 ff f2 	li      r9,-14
    15b4:	48 00 03 28 	b       18dc <sfn_ioctl+0xff8>
        if (value_tmp > SFN_MAX || value_tmp < 0)
    15b8:	81 41 01 10 	lwz     r10,272(r1)
    15bc:	3d 20 00 0f 	lis     r9,15
    15c0:	61 29 ff ff 	ori     r9,r9,65535
    15c4:	7f 8a 48 40 	cmplw   cr7,r10,r9
    15c8:	40 9d 00 0c 	ble     cr7,15d4 <sfn_ioctl+0xcf0>
            return -EFAULT;
    15cc:	39 20 ff f2 	li      r9,-14
    15d0:	48 00 03 0c 	b       18dc <sfn_ioctl+0xff8>
        if((pp->sfn_specific == -1) && (pp->sfn_periodic == 0)) {
    15d4:	81 21 00 08 	lwz     r9,8(r1)
    15d8:	81 49 00 0c 	lwz     r10,12(r9)
    15dc:	39 20 ff ff 	li      r9,-1
    15e0:	7f 8a 48 00 	cmpw    cr7,r10,r9
    15e4:	40 9e 00 a4 	bne     cr7,1688 <sfn_ioctl+0xda4>
    15e8:	81 21 00 08 	lwz     r9,8(r1)
    15ec:	81 29 00 10 	lwz     r9,16(r9)
    15f0:	2f 89 00 00 	cmpwi   cr7,r9,0
    15f4:	40 9e 00 94 	bne     cr7,1688 <sfn_ioctl+0xda4>
            init_waitqueue_head(&pp->irq_wait);     //to initialise the wait queue for the SFN
    15f8:	81 21 00 08 	lwz     r9,8(r1)
    15fc:	39 29 00 14 	addi    r9,r9,20
    1600:	7d 23 4b 78 	mr      r3,r9
    1604:	3d 20 00 00 	lis     r9,0
    1608:	38 89 00 00 	addi    r4,r9,0
    160c:	48 00 00 01 	bl      160c <sfn_ioctl+0xd28>
            pp->sfn_specific=value_tmp;
    1610:	81 41 01 10 	lwz     r10,272(r1)
    1614:	81 21 00 08 	lwz     r9,8(r1)
    1618:	91 49 00 0c 	stw     r10,12(r9)
            list_add(&pp->poll_list, &global_poll_struct.poll_list);
    161c:	81 21 00 08 	lwz     r9,8(r1)
    1620:	39 29 00 1c 	addi    r9,r9,28
    1624:	91 21 00 bc 	stw     r9,188(r1)
    1628:	3d 20 00 00 	lis     r9,0
    162c:	39 29 00 00 	addi    r9,r9,0
    1630:	91 21 00 c0 	stw     r9,192(r1)
 * Insert a new entry after the specified head.
 * This is good for implementing stacks.
 */
static inline void list_add(struct list_head *new, struct list_head *head)
{
	__list_add(new, head, head->next);
    1634:	81 21 00 c0 	lwz     r9,192(r1)
    1638:	81 29 00 00 	lwz     r9,0(r9)
    163c:	81 41 00 bc 	lwz     r10,188(r1)
    1640:	91 41 00 c4 	stw     r10,196(r1)
    1644:	81 41 00 c0 	lwz     r10,192(r1)
    1648:	91 41 00 c8 	stw     r10,200(r1)
    164c:	91 21 00 cc 	stw     r9,204(r1)
#ifndef CONFIG_DEBUG_LIST
static inline void __list_add(struct list_head *new,
			      struct list_head *prev,
			      struct list_head *next)
{
	next->prev = new;
    1650:	81 21 00 cc 	lwz     r9,204(r1)
    1654:	81 41 00 c4 	lwz     r10,196(r1)
    1658:	91 49 00 04 	stw     r10,4(r9)
	new->next = next;
    165c:	81 21 00 c4 	lwz     r9,196(r1)
    1660:	81 41 00 cc 	lwz     r10,204(r1)
    1664:	91 49 00 00 	stw     r10,0(r9)
	new->prev = prev;
    1668:	81 21 00 c4 	lwz     r9,196(r1)
    166c:	81 41 00 c8 	lwz     r10,200(r1)
    1670:	91 49 00 04 	stw     r10,4(r9)
	prev->next = new;
    1674:	81 21 00 c8 	lwz     r9,200(r1)
    1678:	81 41 00 c4 	lwz     r10,196(r1)
    167c:	91 49 00 00 	stw     r10,0(r9)
    1680:	60 00 00 00 	nop
        else
        {
            pp->sfn_periodic = 0;
            pp->sfn_specific=value_tmp;
        }
        break;
    1684:	48 00 02 54 	b       18d8 <sfn_ioctl+0xff4>
            pp->sfn_specific=value_tmp;
            list_add(&pp->poll_list, &global_poll_struct.poll_list);
        }
        else
        {
            pp->sfn_periodic = 0;
    1688:	81 21 00 08 	lwz     r9,8(r1)
    168c:	39 40 00 00 	li      r10,0
    1690:	91 49 00 10 	stw     r10,16(r9)
            pp->sfn_specific=value_tmp;
    1694:	81 41 01 10 	lwz     r10,272(r1)
    1698:	81 21 00 08 	lwz     r9,8(r1)
    169c:	91 49 00 0c 	stw     r10,12(r9)
        }
        break;
    16a0:	48 00 02 38 	b       18d8 <sfn_ioctl+0xff4>

    case SFN_WAIT_PERIODIC:
        if (copy_from_user(&value_tmp, (u32 *) arg, sizeof(u32)))        //Copy from user the SFN
    16a4:	81 21 01 24 	lwz     r9,292(r1)
    16a8:	39 41 01 10 	addi    r10,r1,272
    16ac:	91 41 00 d0 	stw     r10,208(r1)
    16b0:	91 21 00 d4 	stw     r9,212(r1)
    16b4:	39 20 00 04 	li      r9,4
    16b8:	91 21 00 d8 	stw     r9,216(r1)
static inline unsigned long copy_from_user(void *to,
		const void __user *from, unsigned long n)
{
	unsigned long over;

	if (access_ok(VERIFY_READ, from, n))
    16bc:	81 41 00 d4 	lwz     r10,212(r1)
    16c0:	7c 49 13 78 	mr      r9,r2
    16c4:	81 29 03 2c 	lwz     r9,812(r9)
    16c8:	7f 8a 48 40 	cmplw   cr7,r10,r9
    16cc:	41 9d 00 38 	bgt     cr7,1704 <sfn_ioctl+0xe20>
    16d0:	81 21 00 d8 	lwz     r9,216(r1)
    16d4:	2f 89 00 00 	cmpwi   cr7,r9,0
    16d8:	41 9e 00 24 	beq     cr7,16fc <sfn_ioctl+0xe18>
    16dc:	81 21 00 d8 	lwz     r9,216(r1)
    16e0:	39 49 ff ff 	addi    r10,r9,-1
    16e4:	7c 49 13 78 	mr      r9,r2
    16e8:	81 09 03 2c 	lwz     r8,812(r9)
    16ec:	81 21 00 d4 	lwz     r9,212(r1)
    16f0:	7d 29 40 50 	subf    r9,r9,r8
    16f4:	7f 8a 48 40 	cmplw   cr7,r10,r9
    16f8:	41 9d 00 0c 	bgt     cr7,1704 <sfn_ioctl+0xe20>
    16fc:	39 20 00 01 	li      r9,1
    1700:	48 00 00 08 	b       1708 <sfn_ioctl+0xe24>
    1704:	39 20 00 00 	li      r9,0
    1708:	2f 89 00 00 	cmpwi   cr7,r9,0
    170c:	41 9e 00 1c 	beq     cr7,1728 <sfn_ioctl+0xe44>
		return __copy_tofrom_user((__force void __user *)to, from, n);
    1710:	80 61 00 d0 	lwz     r3,208(r1)
    1714:	80 81 00 d4 	lwz     r4,212(r1)
    1718:	80 a1 00 d8 	lwz     r5,216(r1)
    171c:	48 00 00 01 	bl      171c <sfn_ioctl+0xe38>
    1720:	7c 69 1b 78 	mr      r9,r3
    1724:	48 00 00 5c 	b       1780 <sfn_ioctl+0xe9c>
	if ((unsigned long)from < TASK_SIZE) {
    1728:	81 41 00 d4 	lwz     r10,212(r1)
    172c:	3d 20 bf ff 	lis     r9,-16385
    1730:	61 29 ff ff 	ori     r9,r9,65535
    1734:	7f 8a 48 40 	cmplw   cr7,r10,r9
    1738:	41 9d 00 44 	bgt     cr7,177c <sfn_ioctl+0xe98>
		over = (unsigned long)from + n - TASK_SIZE;
    173c:	81 41 00 d4 	lwz     r10,212(r1)
    1740:	81 21 00 d8 	lwz     r9,216(r1)
    1744:	7d 2a 4a 14 	add     r9,r10,r9
    1748:	3d 29 40 00 	addis   r9,r9,16384
    174c:	91 21 00 dc 	stw     r9,220(r1)
		return __copy_tofrom_user((__force void __user *)to, from,
    1750:	81 41 00 d8 	lwz     r10,216(r1)
    1754:	81 21 00 dc 	lwz     r9,220(r1)
    1758:	7d 29 50 50 	subf    r9,r9,r10
    175c:	80 61 00 d0 	lwz     r3,208(r1)
    1760:	80 81 00 d4 	lwz     r4,212(r1)
    1764:	7d 25 4b 78 	mr      r5,r9
    1768:	48 00 00 01 	bl      1768 <sfn_ioctl+0xe84>
    176c:	7c 6a 1b 78 	mr      r10,r3
    1770:	81 21 00 dc 	lwz     r9,220(r1)
    1774:	7d 2a 4a 14 	add     r9,r10,r9
    1778:	48 00 00 08 	b       1780 <sfn_ioctl+0xe9c>
				n - over) + over;
	}
	return n;
    177c:	81 21 00 d8 	lwz     r9,216(r1)
    1780:	2f 89 00 00 	cmpwi   cr7,r9,0
    1784:	41 9e 00 0c 	beq     cr7,1790 <sfn_ioctl+0xeac>
            return -EFAULT;     //to initialise the wait queue for the SFN
    1788:	39 20 ff f2 	li      r9,-14
    178c:	48 00 01 50 	b       18dc <sfn_ioctl+0xff8>
        if (value_tmp > SFN_MAX || value_tmp < 1)
    1790:	81 41 01 10 	lwz     r10,272(r1)
    1794:	3d 20 00 0f 	lis     r9,15
    1798:	61 29 ff ff 	ori     r9,r9,65535
    179c:	7f 8a 48 40 	cmplw   cr7,r10,r9
    17a0:	41 9d 00 10 	bgt     cr7,17b0 <sfn_ioctl+0xecc>
    17a4:	81 21 01 10 	lwz     r9,272(r1)
    17a8:	2f 89 00 00 	cmpwi   cr7,r9,0
    17ac:	40 9e 00 0c 	bne     cr7,17b8 <sfn_ioctl+0xed4>
            return -EFAULT;
    17b0:	39 20 ff f2 	li      r9,-14
    17b4:	48 00 01 28 	b       18dc <sfn_ioctl+0xff8>

        if((pp->sfn_specific == -1) && (pp->sfn_periodic == 0)) {
    17b8:	81 21 00 08 	lwz     r9,8(r1)
    17bc:	81 49 00 0c 	lwz     r10,12(r9)
    17c0:	39 20 ff ff 	li      r9,-1
    17c4:	7f 8a 48 00 	cmpw    cr7,r10,r9
    17c8:	40 9e 00 a4 	bne     cr7,186c <sfn_ioctl+0xf88>
    17cc:	81 21 00 08 	lwz     r9,8(r1)
    17d0:	81 29 00 10 	lwz     r9,16(r9)
    17d4:	2f 89 00 00 	cmpwi   cr7,r9,0
    17d8:	40 9e 00 94 	bne     cr7,186c <sfn_ioctl+0xf88>
            init_waitqueue_head(&pp->irq_wait);
    17dc:	81 21 00 08 	lwz     r9,8(r1)
    17e0:	39 29 00 14 	addi    r9,r9,20
    17e4:	7d 23 4b 78 	mr      r3,r9
    17e8:	3d 20 00 00 	lis     r9,0
    17ec:	38 89 00 00 	addi    r4,r9,0
    17f0:	48 00 00 01 	bl      17f0 <sfn_ioctl+0xf0c>
            pp->sfn_periodic = value_tmp;
    17f4:	81 41 01 10 	lwz     r10,272(r1)
    17f8:	81 21 00 08 	lwz     r9,8(r1)
    17fc:	91 49 00 10 	stw     r10,16(r9)
            list_add(&pp->poll_list, &global_poll_struct.poll_list);
    1800:	81 21 00 08 	lwz     r9,8(r1)
    1804:	39 29 00 1c 	addi    r9,r9,28
    1808:	91 21 00 e0 	stw     r9,224(r1)
    180c:	3d 20 00 00 	lis     r9,0
    1810:	39 29 00 00 	addi    r9,r9,0
    1814:	91 21 00 e4 	stw     r9,228(r1)
 * Insert a new entry after the specified head.
 * This is good for implementing stacks.
 */
static inline void list_add(struct list_head *new, struct list_head *head)
{
	__list_add(new, head, head->next);
    1818:	81 21 00 e4 	lwz     r9,228(r1)
    181c:	81 29 00 00 	lwz     r9,0(r9)
    1820:	81 41 00 e0 	lwz     r10,224(r1)
    1824:	91 41 00 e8 	stw     r10,232(r1)
    1828:	81 41 00 e4 	lwz     r10,228(r1)
    182c:	91 41 00 ec 	stw     r10,236(r1)
    1830:	91 21 00 f0 	stw     r9,240(r1)
#ifndef CONFIG_DEBUG_LIST
static inline void __list_add(struct list_head *new,
			      struct list_head *prev,
			      struct list_head *next)
{
	next->prev = new;
    1834:	81 21 00 f0 	lwz     r9,240(r1)
    1838:	81 41 00 e8 	lwz     r10,232(r1)
    183c:	91 49 00 04 	stw     r10,4(r9)
	new->next = next;
    1840:	81 21 00 e8 	lwz     r9,232(r1)
    1844:	81 41 00 f0 	lwz     r10,240(r1)
    1848:	91 49 00 00 	stw     r10,0(r9)
	new->prev = prev;
    184c:	81 21 00 e8 	lwz     r9,232(r1)
    1850:	81 41 00 ec 	lwz     r10,236(r1)
    1854:	91 49 00 04 	stw     r10,4(r9)
	prev->next = new;
    1858:	81 21 00 ec 	lwz     r9,236(r1)
    185c:	81 41 00 e8 	lwz     r10,232(r1)
    1860:	91 49 00 00 	stw     r10,0(r9)
    1864:	60 00 00 00 	nop
        else
        {
            pp->sfn_specific = -1;
            pp->sfn_periodic= value_tmp;
        }
        break;
    1868:	48 00 00 70 	b       18d8 <sfn_ioctl+0xff4>
            pp->sfn_periodic = value_tmp;
            list_add(&pp->poll_list, &global_poll_struct.poll_list);
        }
        else
        {
            pp->sfn_specific = -1;
    186c:	81 21 00 08 	lwz     r9,8(r1)
    1870:	39 40 ff ff 	li      r10,-1
    1874:	91 49 00 0c 	stw     r10,12(r9)
            pp->sfn_periodic= value_tmp;
    1878:	81 41 01 10 	lwz     r10,272(r1)
    187c:	81 21 00 08 	lwz     r9,8(r1)
    1880:	91 49 00 10 	stw     r10,16(r9)
        }
        break;
    1884:	48 00 00 54 	b       18d8 <sfn_ioctl+0xff4>

    case SFN_SYNC_BTSRTC_WITH_OSUTC:
        osutc_bts_rtc_sync = 1;
    1888:	3d 20 00 00 	lis     r9,0
    188c:	39 40 00 01 	li      r10,1
    1890:	91 49 00 00 	stw     r10,0(r9)
        break;
    1894:	48 00 00 44 	b       18d8 <sfn_ioctl+0xff4>

    default:
        pr_err("SFN IOCTL: Unknown command: %u\n", cmd);
    1898:	3d 20 00 00 	lis     r9,0
    189c:	38 69 00 00 	addi    r3,r9,0
    18a0:	80 81 01 20 	lwz     r4,288(r1)
    18a4:	4c c6 31 82 	crclr   4*cr1+eq
    18a8:	48 00 00 01 	bl      18a8 <sfn_ioctl+0xfc4>
        return -ENOTTY;
    18ac:	39 20 ff e7 	li      r9,-25
    18b0:	48 00 00 2c 	b       18dc <sfn_ioctl+0xff8>
#endif
        sfn_param.sfn = local_hsfn;             //write SFN
        sfn_param.timestamp = timestamp;        //write system time
        if (copy_to_user((struct sfn_data *)arg, &sfn_param, sizeof(struct sfn_data)))
            return -EFAULT;
        break;
    18b4:	60 00 00 00 	nop
    18b8:	48 00 00 20 	b       18d8 <sfn_ioctl+0xff4>

    case SFN_GET_BCN:
        if (copy_to_user((uint64_t *)arg, &bcn_n1, sizeof(uint64_t)))
            return -EFAULT;
        break;
    18bc:	60 00 00 00 	nop
    18c0:	48 00 00 18 	b       18d8 <sfn_ioctl+0xff4>

    case SFN_GET_BTSRTC_BCN:
        calculate_current_bts_rtc(&bts_rtc_value);
        if (copy_to_user((struct sfn_data *)arg, &bts_rtc_value, sizeof(struct sfn_data)))
            return -EFAULT;
        break;
    18c4:	60 00 00 00 	nop
    18c8:	48 00 00 10 	b       18d8 <sfn_ioctl+0xff4>
        sfn_param.sfn = local_hsfn;             //write current SFN
        sfn_param.timestamp = timestamp;        //write current system time
        sfn_param.bcn_n1 = bcn_n1;              //write current BCN N1
        if (copy_to_user((struct sfn_data *)arg, &sfn_param, sizeof(struct sfn_data)))
            return -EFAULT;
        break;
    18cc:	60 00 00 00 	nop
    18d0:	48 00 00 08 	b       18d8 <sfn_ioctl+0xff4>
    case SFN_WAIT_BTSRTC_BCN:
        interruptible_sleep_on(&sfn_next_queue);    //Wakeup by ISR
        calculate_current_bts_rtc(&bts_rtc_value);
        if (copy_to_user((struct sfn_data *)arg, &bts_rtc_value, sizeof(struct sfn_data)))
            return -EFAULT;
        break;
    18d4:	60 00 00 00 	nop
    default:
        pr_err("SFN IOCTL: Unknown command: %u\n", cmd);
        return -ENOTTY;
    }

    return 0;
    18d8:	39 20 00 00 	li      r9,0
}
    18dc:	7d 23 4b 78 	mr      r3,r9
    18e0:	80 01 01 34 	lwz     r0,308(r1)
    18e4:	7c 08 03 a6 	mtlr    r0
    18e8:	38 21 01 30 	addi    r1,r1,304
    18ec:	4e 80 00 20 	blr

000018f0 <sfn_close>:
 *
 * \retval      0           ok
 *
 */
static int sfn_close(struct inode *inode, struct file *file)
{
    18f0:	94 21 ff c0 	stwu    r1,-64(r1)
    18f4:	7c 08 02 a6 	mflr    r0
    18f8:	90 01 00 44 	stw     r0,68(r1)
    18fc:	90 61 00 38 	stw     r3,56(r1)
    1900:	90 81 00 3c 	stw     r4,60(r1)

    struct struct_poll_sfn *pp = file->private_data;
    1904:	81 21 00 3c 	lwz     r9,60(r1)
    1908:	81 29 00 6c 	lwz     r9,108(r9)
    190c:	91 21 00 10 	stw     r9,16(r1)
    struct struct_poll_sfn *poll_tmp;
    int list_elements = 0;
    1910:	39 20 00 00 	li      r9,0
    1914:	91 21 00 0c 	stw     r9,12(r1)

    if ((pp->sfn_specific < 4096 && pp->sfn_specific >= 0) || pp->sfn_periodic)
    1918:	81 21 00 10 	lwz     r9,16(r1)
    191c:	81 29 00 0c 	lwz     r9,12(r9)
    1920:	2b 89 0f ff 	cmplwi  cr7,r9,4095
    1924:	40 9d 00 14 	ble     cr7,1938 <sfn_close+0x48>
    1928:	81 21 00 10 	lwz     r9,16(r1)
    192c:	81 29 00 10 	lwz     r9,16(r9)
    1930:	2f 89 00 00 	cmpwi   cr7,r9,0
    1934:	41 9e 01 2c 	beq     cr7,1a60 <sfn_close+0x170>
    {
        list_for_each_entry(poll_tmp, &global_poll_struct.poll_list, poll_list)
    1938:	3d 20 00 00 	lis     r9,0
    193c:	39 29 00 00 	addi    r9,r9,0
    1940:	81 29 00 1c 	lwz     r9,28(r9)
    1944:	91 21 00 14 	stw     r9,20(r1)
    1948:	81 21 00 14 	lwz     r9,20(r1)
    194c:	39 29 ff e4 	addi    r9,r9,-28
    1950:	91 21 00 08 	stw     r9,8(r1)
    1954:	48 00 00 ac 	b       1a00 <sfn_close+0x110>
        {
            list_elements++;
    1958:	81 21 00 0c 	lwz     r9,12(r1)
    195c:	39 29 00 01 	addi    r9,r9,1
    1960:	91 21 00 0c 	stw     r9,12(r1)
            if (poll_tmp->sfn_file == file)
    1964:	81 21 00 08 	lwz     r9,8(r1)
    1968:	81 49 00 00 	lwz     r10,0(r9)
    196c:	81 21 00 3c 	lwz     r9,60(r1)
    1970:	7f 8a 48 00 	cmpw    cr7,r10,r9
    1974:	40 9e 00 74 	bne     cr7,19e8 <sfn_close+0xf8>
            {
                list_del(&pp->poll_list);
    1978:	81 21 00 10 	lwz     r9,16(r1)
    197c:	39 29 00 1c 	addi    r9,r9,28
    1980:	91 21 00 1c 	stw     r9,28(r1)
 * in an undefined state.
 */
#ifndef CONFIG_DEBUG_LIST
static inline void list_del(struct list_head *entry)
{
	__list_del(entry->prev, entry->next);
    1984:	81 21 00 1c 	lwz     r9,28(r1)
    1988:	81 49 00 04 	lwz     r10,4(r9)
    198c:	81 21 00 1c 	lwz     r9,28(r1)
    1990:	81 29 00 00 	lwz     r9,0(r9)
    1994:	91 41 00 20 	stw     r10,32(r1)
    1998:	91 21 00 24 	stw     r9,36(r1)
 * This is only for internal list manipulation where we know
 * the prev/next entries already!
 */
static inline void __list_del(struct list_head * prev, struct list_head * next)
{
	next->prev = prev;
    199c:	81 21 00 24 	lwz     r9,36(r1)
    19a0:	81 41 00 20 	lwz     r10,32(r1)
    19a4:	91 49 00 04 	stw     r10,4(r9)
	prev->next = next;
    19a8:	81 21 00 20 	lwz     r9,32(r1)
    19ac:	81 41 00 24 	lwz     r10,36(r1)
    19b0:	91 49 00 00 	stw     r10,0(r9)
 */
#ifndef CONFIG_DEBUG_LIST
static inline void list_del(struct list_head *entry)
{
	__list_del(entry->prev, entry->next);
	entry->next = LIST_POISON1;
    19b4:	81 21 00 1c 	lwz     r9,28(r1)
    19b8:	3d 40 00 10 	lis     r10,16
    19bc:	61 4a 01 00 	ori     r10,r10,256
    19c0:	91 49 00 00 	stw     r10,0(r9)
	entry->prev = LIST_POISON2;
    19c4:	81 21 00 1c 	lwz     r9,28(r1)
    19c8:	3d 40 00 20 	lis     r10,32
    19cc:	61 4a 02 00 	ori     r10,r10,512
    19d0:	91 49 00 04 	stw     r10,4(r9)
                printk("Delete pp\n");
    19d4:	3d 20 00 00 	lis     r9,0
    19d8:	38 69 00 00 	addi    r3,r9,0
    19dc:	4c c6 31 82 	crclr   4*cr1+eq
    19e0:	48 00 00 01 	bl      19e0 <sfn_close+0xf0>
                break;
    19e4:	48 00 00 64 	b       1a48 <sfn_close+0x158>
    struct struct_poll_sfn *poll_tmp;
    int list_elements = 0;

    if ((pp->sfn_specific < 4096 && pp->sfn_specific >= 0) || pp->sfn_periodic)
    {
        list_for_each_entry(poll_tmp, &global_poll_struct.poll_list, poll_list)
    19e8:	81 21 00 08 	lwz     r9,8(r1)
    19ec:	81 29 00 1c 	lwz     r9,28(r9)
    19f0:	91 21 00 18 	stw     r9,24(r1)
    19f4:	81 21 00 18 	lwz     r9,24(r1)
    19f8:	39 29 ff e4 	addi    r9,r9,-28
    19fc:	91 21 00 08 	stw     r9,8(r1)
    1a00:	81 21 00 08 	lwz     r9,8(r1)
    1a04:	81 29 00 1c 	lwz     r9,28(r9)
    1a08:	91 21 00 28 	stw     r9,40(r1)
#define ARCH_HAS_PREFETCHW
#define ARCH_HAS_SPINLOCK_PREFETCH

static inline void prefetch(const void *x)
{
	if (unlikely(!x))
    1a0c:	81 21 00 28 	lwz     r9,40(r1)
    1a10:	2f 89 00 00 	cmpwi   cr7,r9,0
    1a14:	39 20 00 00 	li      r9,0
    1a18:	39 40 00 01 	li      r10,1
    1a1c:	7d 2a 4f 9e 	isel    r9,r10,r9,30
    1a20:	55 29 06 3e 	clrlwi  r9,r9,24
    1a24:	2f 89 00 00 	cmpwi   cr7,r9,0
    1a28:	40 9e 00 0c 	bne     cr7,1a34 <sfn_close+0x144>
		return;

	__asm__ __volatile__ ("dcbt 0,%0" : : "r" (x));
    1a2c:	81 21 00 28 	lwz     r9,40(r1)
    1a30:	7c 00 4a 2c 	dcbt    0,r9
    1a34:	81 41 00 08 	lwz     r10,8(r1)
    1a38:	3d 20 00 00 	lis     r9,0
    1a3c:	39 29 00 00 	addi    r9,r9,0
    1a40:	7f 8a 48 00 	cmpw    cr7,r10,r9
    1a44:	40 9e ff 14 	bne     cr7,1958 <sfn_close+0x68>
                printk("Delete pp\n");
                break;
            }
        }

        if (list_elements == 1) { /*By last list element set poll_interrupt_sync 0 =>*/
    1a48:	81 21 00 0c 	lwz     r9,12(r1)
    1a4c:	2f 89 00 01 	cmpwi   cr7,r9,1
    1a50:	40 9e 00 10 	bne     cr7,1a60 <sfn_close+0x170>
            poll_interrupt_sync = 0;    /* none syncronisation more between ISR and sfn_poll*/
    1a54:	3d 20 00 00 	lis     r9,0
    1a58:	39 40 00 00 	li      r10,0
    1a5c:	91 49 00 00 	stw     r10,0(r9)
        }
    }

    kfree(pp);
    1a60:	80 61 00 10 	lwz     r3,16(r1)
    1a64:	48 00 00 01 	bl      1a64 <sfn_close+0x174>
    printk("sfn_close called\n");
    1a68:	3d 20 00 00 	lis     r9,0
    1a6c:	38 69 00 00 	addi    r3,r9,0
    1a70:	4c c6 31 82 	crclr   4*cr1+eq
    1a74:	48 00 00 01 	bl      1a74 <sfn_close+0x184>

    return 0;
    1a78:	39 20 00 00 	li      r9,0
}
    1a7c:	7d 23 4b 78 	mr      r3,r9
    1a80:	80 01 00 44 	lwz     r0,68(r1)
    1a84:	7c 08 03 a6 	mtlr    r0
    1a88:	38 21 00 40 	addi    r1,r1,64
    1a8c:	4e 80 00 20 	blr

00001a90 <sfn_open>:
 * \retval      ENOMEM      Can not allocate the memory
 * \retval      0           ok
 *
 */
static int sfn_open(struct inode *inode, struct file *file)
{
    1a90:	94 21 ff e0 	stwu    r1,-32(r1)
    1a94:	7c 08 02 a6 	mflr    r0
    1a98:	90 01 00 24 	stw     r0,36(r1)
    1a9c:	90 61 00 18 	stw     r3,24(r1)
    1aa0:	90 81 00 1c 	stw     r4,28(r1)
    1aa4:	39 20 00 24 	li      r9,36
    1aa8:	91 21 00 0c 	stw     r9,12(r1)
    1aac:	39 20 00 d0 	li      r9,208
    1ab0:	91 21 00 10 	stw     r9,16(r1)
		trace_kmalloc(_THIS_IP_, ret,
			      size, slab_buffer_size(cachep), flags);

		return ret;
	}
	return __kmalloc(size, flags);
    1ab4:	80 61 00 0c 	lwz     r3,12(r1)
    1ab8:	80 81 00 10 	lwz     r4,16(r1)
    1abc:	48 00 00 01 	bl      1abc <sfn_open+0x2c>
    1ac0:	7c 69 1b 78 	mr      r9,r3
    struct struct_poll_sfn *pp;
    pp = kmalloc(sizeof(struct struct_poll_sfn), GFP_KERNEL);
    1ac4:	91 21 00 08 	stw     r9,8(r1)
    if (!pp)
    1ac8:	81 21 00 08 	lwz     r9,8(r1)
    1acc:	2f 89 00 00 	cmpwi   cr7,r9,0
    1ad0:	40 9e 00 0c 	bne     cr7,1adc <sfn_open+0x4c>
        return -ENOMEM;
    1ad4:	39 20 ff f4 	li      r9,-12
    1ad8:	48 00 00 48 	b       1b20 <sfn_open+0x90>

    pp->sfn_file = file;
    1adc:	81 21 00 08 	lwz     r9,8(r1)
    1ae0:	81 41 00 1c 	lwz     r10,28(r1)
    1ae4:	91 49 00 00 	stw     r10,0(r9)
    pp->sfn_specific = -1;
    1ae8:	81 21 00 08 	lwz     r9,8(r1)
    1aec:	39 40 ff ff 	li      r10,-1
    1af0:	91 49 00 0c 	stw     r10,12(r9)
    pp->sfn_periodic = 0;
    1af4:	81 21 00 08 	lwz     r9,8(r1)
    1af8:	39 40 00 00 	li      r10,0
    1afc:	91 49 00 10 	stw     r10,16(r9)
    file->private_data = pp;
    1b00:	81 21 00 1c 	lwz     r9,28(r1)
    1b04:	81 41 00 08 	lwz     r10,8(r1)
    1b08:	91 49 00 6c 	stw     r10,108(r9)
    printk("sfn_open called\n");
    1b0c:	3d 20 00 00 	lis     r9,0
    1b10:	38 69 00 00 	addi    r3,r9,0
    1b14:	4c c6 31 82 	crclr   4*cr1+eq
    1b18:	48 00 00 01 	bl      1b18 <sfn_open+0x88>
    return 0;
    1b1c:	39 20 00 00 	li      r9,0

}
    1b20:	7d 23 4b 78 	mr      r3,r9
    1b24:	80 01 00 24 	lwz     r0,36(r1)
    1b28:	7c 08 03 a6 	mtlr    r0
    1b2c:	38 21 00 20 	addi    r1,r1,32
    1b30:	4e 80 00 20 	blr

00001b34 <sfn_poll>:
 * \retval      POLLIN      Wake up the File descriptor by select
 *
 */
static unsigned int sfn_poll(struct file *file,
                             struct poll_table_struct *sfn_pool_table)
{
    1b34:	94 21 ff e0 	stwu    r1,-32(r1)
    1b38:	7c 08 02 a6 	mflr    r0
    1b3c:	90 01 00 24 	stw     r0,36(r1)
    1b40:	90 61 00 18 	stw     r3,24(r1)
    1b44:	90 81 00 1c 	stw     r4,28(r1)
    struct struct_poll_sfn *pp = file->private_data;
    1b48:	81 21 00 18 	lwz     r9,24(r1)
    1b4c:	81 29 00 6c 	lwz     r9,108(r9)
    1b50:	91 21 00 08 	stw     r9,8(r1)

    poll_interrupt_sync = 1;
    1b54:	3d 20 00 00 	lis     r9,0
    1b58:	39 40 00 01 	li      r10,1
    1b5c:	91 49 00 00 	stw     r10,0(r9)

    poll_wait(file, &pp->irq_wait, sfn_pool_table);
    1b60:	81 21 00 08 	lwz     r9,8(r1)
    1b64:	39 29 00 14 	addi    r9,r9,20
    1b68:	81 41 00 18 	lwz     r10,24(r1)
    1b6c:	91 41 00 0c 	stw     r10,12(r1)
    1b70:	91 21 00 10 	stw     r9,16(r1)
    1b74:	81 21 00 1c 	lwz     r9,28(r1)
    1b78:	91 21 00 14 	stw     r9,20(r1)
	unsigned long key;
} poll_table;

static inline void poll_wait(struct file * filp, wait_queue_head_t * wait_address, poll_table *p)
{
	if (p && wait_address)
    1b7c:	81 21 00 14 	lwz     r9,20(r1)
    1b80:	2f 89 00 00 	cmpwi   cr7,r9,0
    1b84:	41 9e 00 2c 	beq     cr7,1bb0 <sfn_poll+0x7c>
    1b88:	81 21 00 10 	lwz     r9,16(r1)
    1b8c:	2f 89 00 00 	cmpwi   cr7,r9,0
    1b90:	41 9e 00 20 	beq     cr7,1bb0 <sfn_poll+0x7c>
		p->qproc(filp, wait_address, p);
    1b94:	81 21 00 14 	lwz     r9,20(r1)
    1b98:	81 29 00 00 	lwz     r9,0(r9)
    1b9c:	80 61 00 0c 	lwz     r3,12(r1)
    1ba0:	80 81 00 10 	lwz     r4,16(r1)
    1ba4:	80 a1 00 14 	lwz     r5,20(r1)
    1ba8:	7d 29 03 a6 	mtctr   r9
    1bac:	4e 80 04 21 	bctrl

    if (pp->sync)
    1bb0:	81 21 00 08 	lwz     r9,8(r1)
    1bb4:	81 29 00 04 	lwz     r9,4(r9)
    1bb8:	2f 89 00 00 	cmpwi   cr7,r9,0
    1bbc:	41 9e 00 88 	beq     cr7,1c44 <sfn_poll+0x110>
    {
        if (pp->sfn_periodic)
    1bc0:	81 21 00 08 	lwz     r9,8(r1)
    1bc4:	81 29 00 10 	lwz     r9,16(r9)
    1bc8:	2f 89 00 00 	cmpwi   cr7,r9,0
    1bcc:	41 9e 00 4c 	beq     cr7,1c18 <sfn_poll+0xe4>
        {
            if (!(pp->sfn_tmp % pp->sfn_periodic) && pp->sfn_tmp)
    1bd0:	81 21 00 08 	lwz     r9,8(r1)
    1bd4:	81 29 00 08 	lwz     r9,8(r9)
    1bd8:	81 41 00 08 	lwz     r10,8(r1)
    1bdc:	81 4a 00 10 	lwz     r10,16(r10)
    1be0:	7d 09 53 96 	divwu   r8,r9,r10
    1be4:	7d 48 51 d6 	mullw   r10,r8,r10
    1be8:	7d 2a 48 50 	subf    r9,r10,r9
    1bec:	2f 89 00 00 	cmpwi   cr7,r9,0
    1bf0:	40 9e 00 54 	bne     cr7,1c44 <sfn_poll+0x110>
    1bf4:	81 21 00 08 	lwz     r9,8(r1)
    1bf8:	81 29 00 08 	lwz     r9,8(r9)
    1bfc:	2f 89 00 00 	cmpwi   cr7,r9,0
    1c00:	41 9e 00 44 	beq     cr7,1c44 <sfn_poll+0x110>
            {
                pp->sync = 0;   /* pp->sync is set by ISR*/
    1c04:	81 21 00 08 	lwz     r9,8(r1)
    1c08:	39 40 00 00 	li      r10,0
    1c0c:	91 49 00 04 	stw     r10,4(r9)
                return POLLIN | POLLRDNORM | POLLHUP;
    1c10:	39 20 00 51 	li      r9,81
    1c14:	48 00 00 34 	b       1c48 <sfn_poll+0x114>
            }
        }
        else
        {
            if (pp->sfn_tmp == pp->sfn_specific)
    1c18:	81 21 00 08 	lwz     r9,8(r1)
    1c1c:	81 49 00 08 	lwz     r10,8(r9)
    1c20:	81 21 00 08 	lwz     r9,8(r1)
    1c24:	81 29 00 0c 	lwz     r9,12(r9)
    1c28:	7f 8a 48 00 	cmpw    cr7,r10,r9
    1c2c:	40 9e 00 18 	bne     cr7,1c44 <sfn_poll+0x110>
            {
                pp->sync = 0;   /*pp->sync is set by ISR*/
    1c30:	81 21 00 08 	lwz     r9,8(r1)
    1c34:	39 40 00 00 	li      r10,0
    1c38:	91 49 00 04 	stw     r10,4(r9)
                return POLLIN | POLLRDNORM | POLLHUP;
    1c3c:	39 20 00 51 	li      r9,81
    1c40:	48 00 00 08 	b       1c48 <sfn_poll+0x114>
            }
        }
    }
    return 0;
    1c44:	39 20 00 00 	li      r9,0
}
    1c48:	7d 23 4b 78 	mr      r3,r9
    1c4c:	80 01 00 24 	lwz     r0,36(r1)
    1c50:	7c 08 03 a6 	mtlr    r0
    1c54:	38 21 00 20 	addi    r1,r1,32
    1c58:	4e 80 00 20 	blr

Disassembly of section .init.text:

00000000 <init_module>:
 * \retval      0           ok
 * \retval      < 0      error
 *
 */
static int __init sfn_init(void)
{
   0:	94 21 ff c0 	stwu    r1,-64(r1)
   4:	7c 08 02 a6 	mflr    r0
   8:	90 01 00 44 	stw     r0,68(r1)
   c:	bf a1 00 34 	stmw    r29,52(r1)
    int ret;

    bcn_n1 = 0;
  10:	3d 20 00 00 	lis     r9,0
  14:	39 09 00 00 	addi    r8,r9,0
  18:	39 20 00 00 	li      r9,0
  1c:	39 40 00 00 	li      r10,0
  20:	91 28 00 00 	stw     r9,0(r8)
  24:	91 48 00 04 	stw     r10,4(r8)
    bcn_n2 = 0;
  28:	3d 20 00 00 	lis     r9,0
  2c:	39 40 00 00 	li      r10,0
  30:	91 49 00 00 	stw     r10,0(r9)
    bcn_n1_user_sync = 0;
  34:	3d 20 00 00 	lis     r9,0
  38:	39 40 00 00 	li      r10,0
  3c:	91 49 00 00 	stw     r10,0(r9)
    bcn_n1_user_value = 0;
  40:	3d 20 00 00 	lis     r9,0
  44:	39 09 00 00 	addi    r8,r9,0
  48:	39 20 00 00 	li      r9,0
  4c:	39 40 00 00 	li      r10,0
  50:	91 28 00 00 	stw     r9,0(r8)
  54:	91 48 00 04 	stw     r10,4(r8)
    bts_rtc_sync = 0;
  58:	3d 20 00 00 	lis     r9,0
  5c:	39 40 00 00 	li      r10,0
  60:	91 49 00 00 	stw     r10,0(r9)
    local_hsfn = 0;
  64:	3d 20 00 00 	lis     r9,0
  68:	39 40 00 00 	li      r10,0
  6c:	91 49 00 00 	stw     r10,0(r9)
    memset((void*)&bts_rtc_value, 0, sizeof(bts_rtc_value));
  70:	3d 20 00 00 	lis     r9,0
  74:	38 69 00 00 	addi    r3,r9,0
  78:	38 80 00 00 	li      r4,0
  7c:	38 a0 00 18 	li      r5,24
  80:	48 00 00 01 	bl      80 <init_module+0x80>
    memset((void*)&bts_rtc_user_value, 0, sizeof(bts_rtc_user_value));
  84:	3d 20 00 00 	lis     r9,0
  88:	38 69 00 00 	addi    r3,r9,0
  8c:	38 80 00 00 	li      r4,0
  90:	38 a0 00 18 	li      r5,24
  94:	48 00 00 01 	bl      94 <init_module+0x94>

    printk(KERN_INFO "Initializing sfn_mod\n");
  98:	3d 20 00 00 	lis     r9,0
  9c:	38 69 00 00 	addi    r3,r9,0
  a0:	4c c6 31 82 	crclr   4*cr1+eq
  a4:	48 00 00 01 	bl      a4 <init_module+0xa4>
#ifdef CONFIG_FCMD              //By FCMD is Frame Register on CASA2
    if (!(sfn_number = ioremap(CFG_CASA2_BASE + (CASA2_FRAME_NR_REG * 2), 2)))
  a8:	3d 20 d0 10 	lis     r9,-12272
  ac:	61 23 00 0e 	ori     r3,r9,14
  b0:	38 80 00 02 	li      r4,2
  b4:	48 00 00 01 	bl      b4 <init_module+0xb4>
  b8:	7c 6a 1b 78 	mr      r10,r3
  bc:	3d 20 00 00 	lis     r9,0
  c0:	91 49 00 00 	stw     r10,0(r9)
  c4:	3d 20 00 00 	lis     r9,0
  c8:	81 29 00 00 	lwz     r9,0(r9)
  cc:	2f 89 00 00 	cmpwi   cr7,r9,0
  d0:	40 9e 00 1c 	bne     cr7,ec <init_module+0xec>
    {
        printk(KERN_ERR "CASA2: unable to map FRAME_REG\n");
  d4:	3d 20 00 00 	lis     r9,0
  d8:	38 69 00 00 	addi    r3,r9,0
  dc:	4c c6 31 82 	crclr   4*cr1+eq
  e0:	48 00 00 01 	bl      e0 <init_module+0xe0>
        return -ENOMEM;
  e4:	39 20 ff f4 	li      r9,-12
  e8:	48 00 01 54 	b       23c <init_module+0x23c>
#endif
#ifdef CONFIG_FSPC              //By FSPC we simulate the Frame Register
    sfn_number = &local_hsfn;
#endif

    bcn_n1 = SFN_READ(sfn_number);
  ec:	3d 20 00 00 	lis     r9,0
  f0:	81 29 00 00 	lwz     r9,0(r9)
  f4:	91 21 00 0c 	stw     r9,12(r1)
  f8:	81 21 00 0c 	lwz     r9,12(r1)
  fc:	91 21 00 10 	stw     r9,16(r1)
	IO_SET_SYNC_FLAG();						\
}


DEF_MMIO_IN_BE(in_8,     8, lbz);
DEF_MMIO_IN_BE(in_be16, 16, lhz);
 100:	81 21 00 10 	lwz     r9,16(r1)
 104:	7c 00 04 ac 	sync    
 108:	a3 a9 00 00 	lhz     r29,0(r9)
 10c:	0c 1d 00 00 	twi     0,r29,0
 110:	4c 00 01 2c 	isync
 114:	b3 a1 00 14 	sth     r29,20(r1)
 118:	a1 21 00 14 	lhz     r9,20(r1)
 11c:	55 29 04 3e 	clrlwi  r9,r9,16
 120:	7d 3f 4b 78 	mr      r31,r9
 124:	3b c0 00 00 	li      r30,0
 128:	3d 20 00 00 	lis     r9,0
 12c:	39 29 00 00 	addi    r9,r9,0
 130:	93 c9 00 00 	stw     r30,0(r9)
 134:	93 e9 00 04 	stw     r31,4(r9)
    local_hsfn = *sfn_number;
 138:	3d 20 00 00 	lis     r9,0
 13c:	81 29 00 00 	lwz     r9,0(r9)
 140:	a1 29 00 00 	lhz     r9,0(r9)
 144:	55 29 04 3e 	clrlwi  r9,r9,16
 148:	7d 2a 4b 78 	mr      r10,r9
 14c:	3d 20 00 00 	lis     r9,0
 150:	91 49 00 00 	stw     r10,0(r9)

    ret = misc_register(&sfn_dev);
 154:	3d 20 00 00 	lis     r9,0
 158:	38 69 00 00 	addi    r3,r9,0
 15c:	48 00 00 01 	bl      15c <init_module+0x15c>
 160:	90 61 00 08 	stw     r3,8(r1)
    if (ret)
 164:	81 21 00 08 	lwz     r9,8(r1)
 168:	2f 89 00 00 	cmpwi   cr7,r9,0
 16c:	41 9e 00 1c 	beq     cr7,188 <init_module+0x188>
    {
        printk(KERN_ERR "Unable to register sfn_mod device.\n");
 170:	3d 20 00 00 	lis     r9,0
 174:	38 69 00 00 	addi    r3,r9,0
 178:	4c c6 31 82 	crclr   4*cr1+eq
 17c:	48 00 00 01 	bl      17c <init_module+0x17c>
        return ret;
 180:	81 21 00 08 	lwz     r9,8(r1)
 184:	48 00 00 b8 	b       23c <init_module+0x23c>
    }
    memset(&global_poll_struct, 0, sizeof(struct struct_poll_sfn));
 188:	3d 20 00 00 	lis     r9,0
 18c:	38 69 00 00 	addi    r3,r9,0
 190:	38 80 00 00 	li      r4,0
 194:	38 a0 00 24 	li      r5,36
 198:	48 00 00 01 	bl      198 <init_module+0x198>

#ifdef CONFIG_FCMD
    ret = mddg_request_irq(SFN_INTERRUPT, (irq_isr_t) sfn_interrupt, IRQF_DISABLED,DEVICE_DRIVER_NAME_SFN,  NULL);
 19c:	38 60 00 00 	li      r3,0
 1a0:	38 80 00 08 	li      r4,8
 1a4:	48 00 00 01 	bl      1a4 <init_module+0x1a4>
 1a8:	7c 69 1b 78 	mr      r9,r3
 1ac:	7d 23 4b 78 	mr      r3,r9
 1b0:	3d 20 00 00 	lis     r9,0
 1b4:	38 89 00 00 	addi    r4,r9,0
 1b8:	38 a0 00 20 	li      r5,32
 1bc:	3d 20 00 00 	lis     r9,0
 1c0:	38 c9 00 00 	addi    r6,r9,0
 1c4:	38 e0 00 00 	li      r7,0
 1c8:	48 00 00 01 	bl      1c8 <init_module+0x1c8>
 1cc:	90 61 00 08 	stw     r3,8(r1)
#else
    ret = request_irq(SFN_IRQ, sfn_interrupt, IRQF_DISABLED,DEVICE_DRIVER_NAME_SFN, NULL);
#endif
    if (ret)
 1d0:	81 21 00 08 	lwz     r9,8(r1)
 1d4:	2f 89 00 00 	cmpwi   cr7,r9,0
 1d8:	41 9e 00 28 	beq     cr7,200 <init_module+0x200>
    {
        misc_deregister(&sfn_dev);
 1dc:	3d 20 00 00 	lis     r9,0
 1e0:	38 69 00 00 	addi    r3,r9,0
 1e4:	48 00 00 01 	bl      1e4 <init_module+0x1e4>
        printk(KERN_ERR "SFN: Unable to set IRQ .\n");
 1e8:	3d 20 00 00 	lis     r9,0
 1ec:	38 69 00 00 	addi    r3,r9,0
 1f0:	4c c6 31 82 	crclr   4*cr1+eq
 1f4:	48 00 00 01 	bl      1f4 <init_module+0x1f4>
        return ret;
 1f8:	81 21 00 08 	lwz     r9,8(r1)
 1fc:	48 00 00 40 	b       23c <init_module+0x23c>
 200:	3d 20 00 00 	lis     r9,0
 204:	39 29 00 00 	addi    r9,r9,0
 208:	91 21 00 18 	stw     r9,24(r1)
#define LIST_HEAD(name) \
	struct list_head name = LIST_HEAD_INIT(name)

static inline void INIT_LIST_HEAD(struct list_head *list)
{
	list->next = list;
 20c:	81 21 00 18 	lwz     r9,24(r1)
 210:	81 41 00 18 	lwz     r10,24(r1)
 214:	91 49 00 00 	stw     r10,0(r9)
	list->prev = list;
 218:	81 21 00 18 	lwz     r9,24(r1)
 21c:	81 41 00 18 	lwz     r10,24(r1)
 220:	91 49 00 04 	stw     r10,4(r9)
    }

    INIT_LIST_HEAD(&global_poll_struct.poll_list);
    init_waitqueue_head(&sfn_next_queue);
 224:	3d 20 00 00 	lis     r9,0
 228:	38 69 00 00 	addi    r3,r9,0
 22c:	3d 20 00 00 	lis     r9,0
 230:	38 89 00 00 	addi    r4,r9,0
 234:	48 00 00 01 	bl      234 <init_module+0x234>

    return ret;
 238:	81 21 00 08 	lwz     r9,8(r1)
}
 23c:	7d 23 4b 78 	mr      r3,r9
 240:	80 01 00 44 	lwz     r0,68(r1)
 244:	7c 08 03 a6 	mtlr    r0
 248:	bb a1 00 34 	lmw     r29,52(r1)
 24c:	38 21 00 40 	addi    r1,r1,64
 250:	4e 80 00 20 	blr

Disassembly of section .exit.text:

00000000 <cleanup_module>:
/**
 *      Used after removed the SFN modul.
 *
 */
static void __exit sfn_exit(void)
{
   0:	94 21 ff f0 	stwu    r1,-16(r1)
   4:	7c 08 02 a6 	mflr    r0
   8:	90 01 00 14 	stw     r0,20(r1)
#ifdef CONFIG_FCMD
    mddg_free_irq(SFN_INTERRUPT,NULL);
   c:	38 60 00 00 	li      r3,0
  10:	38 80 00 08 	li      r4,8
  14:	48 00 00 01 	bl      14 <cleanup_module+0x14>
  18:	7c 69 1b 78 	mr      r9,r3
  1c:	7d 23 4b 78 	mr      r3,r9
  20:	38 80 00 00 	li      r4,0
  24:	48 00 00 01 	bl      24 <cleanup_module+0x24>
    iounmap(sfn_number);
  28:	3d 20 00 00 	lis     r9,0
  2c:	81 29 00 00 	lwz     r9,0(r9)
  30:	7d 23 4b 78 	mr      r3,r9
  34:	48 00 00 01 	bl      34 <cleanup_module+0x34>
#else
    free_irq(SFN_IRQ, NULL);
#endif
    misc_deregister(&sfn_dev);
  38:	3d 20 00 00 	lis     r9,0
  3c:	38 69 00 00 	addi    r3,r9,0
  40:	48 00 00 01 	bl      40 <cleanup_module+0x40>
}
  44:	80 01 00 14 	lwz     r0,20(r1)
  48:	7c 08 03 a6 	mtlr    r0
  4c:	38 21 00 10 	addi    r1,r1,16
  50:	4e 80 00 20 	blr
