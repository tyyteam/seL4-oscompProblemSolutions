# seL4-rv的中断

## initLocalIRQController

开启了定时器中断和外部中断，软件中断因为smp未开启。



## initIRQController

![image-20220411094925357](images/TODO-%E4%B8%AD%E6%96%AD%E4%B8%8E%E4%BE%8B%E5%A4%96.assets/image-20220411094925357.png)

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



# traps.S

## rv的内容

这是内陷处理函数，riscv直接在架构下，arm和x86各放在32和64位文件夹下。

从官方手册没有找到整块的描述写traps.S的思路，打算看看代码。注释见仓库。

[XV6 RISCV源码阅读报告之中断_HarunaP的博客-CSDN博客](https://blog.csdn.net/weixin_43912531/article/details/122138432)

[RISC-V特权等级与Linux内核的启动 - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/164394603)

[RISC-V函数调用规范 - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/462483036)

[riscv 中断和异常处理 - tycoon3 - 博客园 (cnblogs.com)](https://www.cnblogs.com/dream397/p/15687184.html)。

[RISCV: Platform-Level Interrupt Controller(PLIC)_moonllz的博客-CSDN博客](https://blog.csdn.net/moonllz/article/details/52251788)。讲了riscv的local 中断和全局中断

## 龙芯学习

[STM8的线中断和端口中断_塘朗晨光的博客-CSDN博客_stm8引脚中断](https://blog.csdn.net/qq_38963607/article/details/83751304)。

龙芯有3个入口，tlb例外和机器错误例外按照龙芯来，普通例外按照traps.S试试？

