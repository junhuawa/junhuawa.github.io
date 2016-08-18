---
layout: post
title: "Interrupt Framework"
date: 2016-08-18
category: "kernel" 
tags: [kernel]
---

##### Interrupt framework in linux

kernel/irq/irqdesc.c  

```c  
struct irq_desc irq_desc[NR_IRQS] __cacheline_aligned_in_smp = {  
	[0 ... NR_IRQS-1] = {  
		.handle_irq	= handle_bad_irq,  
		.depth		= 1,  
		.lock		= __RAW_SPIN_LOCK_UNLOCKED(irq_desc->lock),  
	}  
};  
```  

NR_IRQS is defined in /arch/x86/include/asm/irq_vectors.h  

```c
CONFIG_NR_CPUS=5120  

#define IO_APIC_VECTOR_LIMIT		( 32 * MAX_IO_APICS )  
# define CPU_VECTOR_LIMIT		(64 * NR_CPUS)  
# define NR_IRQS					\  
	(CPU_VECTOR_LIMIT > IO_APIC_VECTOR_LIMIT ?	\  
		(NR_VECTORS + CPU_VECTOR_LIMIT)  :	\  
		(NR_VECTORS + IO_APIC_VECTOR_LIMIT))  
```  

/arch/include/asm/apicdef.h  

```c  
#ifdef CONFIG_X86_32  
# define MAX_IO_APICS 64  
# define MAX_LOCAL_APIC 256  
#else  
# define MAX_IO_APICS 128  
# define MAX_LOCAL_APIC 32768  
#endif  
```  

/arch/x86/kernel/irq.c  

```c  
/*  
 * do_IRQ handles all normal device IRQ's (the special  
 * SMP cross-CPU interrupts have their own specific  
 * handlers).  
 */
unsigned int __irq_entry do_IRQ(struct pt_regs *regs)  
{  
	struct pt_regs *old_regs = set_irq_regs(regs);  

	/* high bit used in ret_from_ code  */  
	unsigned vector = ~regs->orig_ax;  
	unsigned irq;  

	irq_enter();  
	exit_idle();  

	irq = __this_cpu_read(vector_irq[vector]);  

	if (!handle_irq(irq, regs)) {  
		ack_APIC_irq();  

		if (irq != VECTOR_RETRIGGERED) {  
			pr_emerg_ratelimited("%s: %d.%d No irq handler for vector (irq %d)\n",  
					     __func__, smp_processor_id(),  
					     vector, irq);  
		} else {  
			__this_cpu_write(vector_irq[vector], VECTOR_UNDEFINED);  
		}  
	}  

	irq_exit();  

	set_irq_regs(old_regs);  
	return 1;  
}  
```  

in the /arch/x86/kernel/entry_64.S  
there is jump code, which will jump to call do_IRQ().  

```c  
...  
common_interrupt:  
	XCPT_FRAME  
	ASM_CLAC  
	addq $-0x80,(%rsp)		/* Adjust vector to [-256,-1] range */  
	interrupt do_IRQ  
	/* 0(%rsp): old_rsp-ARGOFFSET */  
ret_from_intr:  
```  


by handle_irq(irq, regs), it will call generic_handle_irq_desc(irq, desc) finally, it's an API provided by generic logic layer.  
通过这个API， 中断的控制被传递到与体系结构无关的中断流控层。  
/arch/x86/kernel/irq_64.c  

```c  
bool handle_irq(unsigned irq, struct pt_regs *regs)  
{  
	struct irq_desc *desc;  

	stack_overflow_check(regs);  

	desc = irq_to_desc(irq);
	if (unlikely(!desc))  
		return false;  

	generic_handle_irq_desc(irq, desc);  
	return true;  
}  
```  

It will call the callback handler registered.  
/include/linux/irqdesc.h  

```c  
/*  
 * Architectures call this to let the generic IRQ layer  
 * handle an interrupt. If the descriptor is attached to an  
 * irqchip-style controller then we call the ->handle_irq() handler,  
 * and it calls __do_IRQ() if it's attached to an irqtype-style controller.  
 */  
static inline void generic_handle_irq_desc(unsigned int irq, struct irq_desc *desc)  
{  
	desc->handle_irq(irq, desc);
}  
```  

中断级连  
irq_set_chained_handler(irq, chained_handler);  

基本原理差不多，硬件抽象层不一样。   

----------------------------------  
register a interrupt:/include/linux/interrupt.h  

```c  
extern int __must_check  
request_threaded_irq(unsigned int irq, irq_handler_t handler,  
		     irq_handler_t thread_fn,  
		     unsigned long flags, const char *name, void *dev);  

static inline int __must_check  
request_irq(unsigned int irq, irq_handler_t handler, unsigned long flags,  
	    const char *name, void *dev)  
{  
	return request_threaded_irq(irq, handler, NULL, flags, name, dev);  
}  
```  

struct irq_chip: 中断控制器的借口抽象  

/include/linux/irq.h  

```c  
irq_data  
/**  
 * struct irq_data - per irq and irq chip data passed down to chip functions  
 * @irq:		interrupt number  
 * @hwirq:		hardware interrupt number, local to the interrupt domain  
 * @node:		node index useful for balancing  
 * @state_use_accessors: status information for irq chip functions.  
 *			Use accessor functions to deal with it  
 * @chip:		low level interrupt hardware access  
 * @domain:		Interrupt translation domain; responsible for mapping  
 *			between hwirq number and linux irq number.  
 * @handler_data:	per-IRQ data for the irq_chip methods  
 * @chip_data:		platform-specific per-chip private data for the chip  
 *			methods, to allow shared chip implementations  
 * @msi_desc:		MSI descriptor  
 * @affinity:		IRQ affinity on SMP  
 *  
 * The fields here need to overlay the ones in irq_desc until we  
 * cleaned up the direct references and switched everything over to  
 * irq_data.  
 */  
struct irq_data {  
	unsigned int		irq;  
	unsigned long		hwirq;  
	unsigned int		node;  
	unsigned int		state_use_accessors;  
	struct irq_chip		*chip;  
	struct irq_domain	*domain;  
	void			*handler_data;  
	void			*chip_data;  
	struct msi_desc		*msi_desc;  
	cpumask_var_t		affinity;  
};  
```  
