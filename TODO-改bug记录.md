# 4.30

修改loongarch的platform_gen.h.in

修改loongarch的config.cmake

新增projects文件夹下的loongarch支持

修改or tp

修改ecall问题

* 新增loongarch_sys_send
* 新增loongarch_sys_reply
* 新增loongarch_sys_send_null
* 新增loongarch_sys_recv
* 新增loongarch_sys_null
* 新增loongarch_sys_send_recv
* 新增loongarch_sys_nbsend_recv
* 修改seL4_Yield
* 修改seL4_DebugHalt
* 修改seL4_DebugSnapshot
* 修改seL4_DebugRun

修改projects/seL4_libs/libsel4vspace/arch_include/loongarch/vspace/arch/page.h

# 5.1

修改setup_vint_size的log函数问题。

添加seL4_LOONGARCH_16K_Page的支持。

修改所有seL4_RISCV_4K_Page的代码为龙芯seL4_LOONGARCH_16K_Page。

修改所有seL4_RISCV_PageTableObject的代码为seL4_LOONGARCH_PageTableObject。

修改所有seL4_RISCV_PageTable_Map的代码为seL4_LOONGARCH_PageTable_Map。

修改所有seL4_RISCV_Mega_Page的代码为seL4_LOONGARCH_Mega_Page。

修改hardware.h中frameSizeConstants，vm_page_size。

* 页表中14位对应16K
  * seL4_PageBits，对应seL4_LOONGARCH_16K_Page，对应LOONGARCHPageBits，LOONGARCH_16K_Page
* 页表中25位对应32M
  * seL4_LargePageBits，对应seL4_LOONGARCH_Mega_Page，对应LOONGARCHMegaPageBits，LOONGARCH_Mega_Page
* 页表中36位对应64G
  * seL4_HugePageBits，对应seL4_LOONGARCH_Giga_Page，对应LOONGARCHGigaPageBits，LOONGARCH_Giga_Page
* 页表中Tera未使用
  * seL4_TeraPageBits，对应seL4_RISCV_Tera_Page，对应LOONGARCHTeraPageBits，LOONGARCH_Tera_Page

修改getActiveIRQ函数及调用。

* 修改read_sip()为read_csr_estat()

修改regressions.c中用户上下文的寄存器。

* 注意riscv的s0和龙芯s9寄存器的用法。

# 5.2

添加projects/sel4test/apps/sel4test-tests/src/tests/faults.c龙芯支持

确认龙芯宏的精确写法：#ifdef CONFIG_ARCH_LOONGARCH

替换riscv的特殊指令：

* riscv的rdcycle指令，
* riscv的sscratch，用SAVEn
* sstatus，考虑中断使能。

添加projects/util_libs/libplatsupport/src/arch/loongarch/irqchip/extio.c

修改sbi.h，暂时让它不报指令错误

修好了fw_arg的问题。

修复找不到local_flush_icache_range

genex.S问题 各种符号找不到

* 解决kernelsp找不到
* 解决do_vint找不到
* 解决找不到cache_parity_error
* 解决找不到do_ade
* 解决找不到do_ale
* 解决找不到do_bp
* 解决找不到do_fpe
* 解决找不到do_fpu
* 解决找不到do_lsx
* 解决找不到do_lasx
* 解决找不到do_lbt
* 解决找不到do_ri
* 解决找不到do_watch
* 解决找不到do_reserved
* 解决找不到handle_syscall

tlbex.S问题 各种符号找不到

* do_page_fault
* swapper_pg_dir

# 5.3

crt0.S

可以编译出来了

# TODO:

* 



# 7.13

![image-20220713111643948](images/TODO-%E6%94%B9bug%E8%AE%B0%E5%BD%95.assets/image-20220713111643948.png)

"ld.d  $t1, $t0, 34*%[REGSIZE] 卡死

没有进入过trap_entry。

所以head.S中跳转到restore_user_context是不能执行的？该函数的上一步是什么？



# 7.14

修改traps.S，让riscv的内核能正常编译





asm volatile语法

![image-20220502112337320](images/TODO-%E6%94%B9bug%E8%AE%B0%E5%BD%95.assets/image-20220502112337320.png)



