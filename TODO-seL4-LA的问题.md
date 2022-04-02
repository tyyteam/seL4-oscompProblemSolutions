# 移植问题

* seL4相关

  * seL4虚拟地址内核区域为什么只映射物理地址一部分空间？

    linux的虚拟地址内核区域映射了整个物理地址空间。

  * 虚拟地址PSpace区域映射了kernel.elf，为什么又单独映射一次kernel elf到虚拟地址空间？
  * 虚拟地址的kernel devices区域是什么？

* loongarch移植相关

  * 既然虚拟内核区域不能映射全部物理地址空间，我们应该映射哪部分物理地址到PSpace?

  * 是否需要调整PSpace的大小？

  * KERNEL_ELF_PADDR_BASE 在0x8000_0000的位置有偏移，这个偏移是什么？

    **OFFSET设置为0x400000应该是可以的**。以前32位的linux/mips的内核一般放在0x80100000，现在loongarch64的linux内核则放在0x9000000000200000开始的地方，它们会被分别映射到物理内存0x100000和0x200000，这个数字没什么特别，就是留下点最低的空间，以防止一些特别的老设备强制占了那些空间。比如显卡，最古老的显卡经常固定把显存放到0xA0000的地方，那个地址的内存不可用。

  * 直接映射窗口相关

    为什么不能使用

  * seL4现有架构中，为什么不像linux一样将内存分出低地址部分，从而支持老设备的DMA？

    老师说一般新设备不会了，老的是isa设备什么的可能无法访问超过1M或者某个比较小的数以上的地址，很多的是不超过32位。



# 

* SMP需要支持？



# Cmake问题

* 单独编译的kernel.elf，与sel4test的spike-build下的kernel/kernel.elf，用readelf查看，各个段有区别。

  单独编译rv内核，默认release模式的信息：

  ![image-20220402212922271](images/TODO-seL4-LA%E7%9A%84%E9%97%AE%E9%A2%98.assets/image-20220402212922271.png)

  

  build-spike/kernel/kernel.elf信息，带debug信息

  ![image-20220402213005547](images/TODO-seL4-LA%E7%9A%84%E9%97%AE%E9%A2%98.assets/image-20220402213005547.png)

  qemu运行的elf文件：

  ![image-20220402213346407](images/TODO-seL4-LA%E7%9A%84%E9%97%AE%E9%A2%98.assets/image-20220402213346407.png)

  

  运行image/images/sel4test-driver-image-riscv-spike 信息：从0x80000000起始的各部分物理地址、虚拟地址等。

  ![image-20220402213924995](images/TODO-seL4-LA%E7%9A%84%E9%97%AE%E9%A2%98.assets/image-20220402213924995.png)

* spike-build的kernel/kernel.elf，怎么生成最终的qemu调用的可执行的elf文件。
* 用龙芯交叉编译器编译。













