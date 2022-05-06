# seL4的中断

## initLocalIRQController

开启了定时器中断和外部中断，软件中断因为smp未开启。



## initIRQController

![image-20220411094925357](images/TODO-4.19-%E6%96%B0%E5%A2%9E%E4%B8%AD%E6%96%AD%E9%83%A8%E5%88%86.assets/image-20220411094925357.png)

此处设置为了0，但是宏定义都是255？？？？

plic，平台级中断控制器。



## init_irq

maxIRQ在src/arch/riscv/platform_gen.h.in

疑惑cap_irq_control_cap_new的定义从哪里来



## platform_gen.h.in

如何生成？























# 龙芯中断

init/main.c的start_kernel()

```
local_irq_disable();//关中断
early_boot_irqs_disabled = true;
...
setup_arch(&command_line);//QT 设置三个中断入口
|-cpu_probe();
| |-per_cpu_trap_init();//内含很多中断设置
| | |-setup_vint_size();//QT 设置ECFG寄存器的VS域
| | |-configure_exception_vector();
| | |-循环设置handler
| | |-tlb_init();
| | | |-setup_tlb_handler();
...
trap_init();//异常初始化
...
early_irq_init();//初始化中段描述符，设置一些缺省信息。与架构关系不大。
init_IRQ();//异常初始化。在loongarch文件夹下
...
softirq_init();//软中断初始化，软中断->下半部不紧急的中断。软中断是分散初始化的，初始化位置见书68页。
...
early_boot_irqs_disabled = false;
local_irq_enable();//开中断
```

local_irq_disable跳转到arch/loongarch/include/asm/irqflags.h

```
static inline void arch_local_irq_disable(void)
{
	u32 flags = 0;
	__asm__ __volatile__(
		"csrxchg %[val], %[mask], %[reg]\n\t"
		: [val] "+r" (flags)
		: [mask] "r" (CSR_CRMD_IE), [reg] "i" (LOONGARCH_CSR_CRMD)
		: "memory");
}
```



arch/loongarch/kernel/traps.c的trap_init()，见红书84



关于外设中断：[early_irq_init_wuye110的博客-CSDN博客_early_irq_init](https://blog.csdn.net/wuye110/article/details/78556622)。

[Linux 中断 —— GIC (数据结构 irq_domain/irq_desc/irq_data/irq_chip/irqaction)_爱洋葱的博客-CSDN博客_irq_desc](https://stephenzhou.blog.csdn.net/article/details/90648475?spm=1001.2101.3001.6650.1&utm_medium=distribute.pc_relevant.none-task-blog-2~default~CTRLIST~Rate-1.pc_relevant_paycolumn_v3&depth_1-utm_source=distribute.pc_relevant.none-task-blog-2~default~CTRLIST~Rate-1.pc_relevant_paycolumn_v3&utm_relevant_index=2)。











