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











