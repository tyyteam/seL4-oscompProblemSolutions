# 龙芯linux内核启动打印信息
![Snipaste_2022-03-31_10-47-29.png](images/Snipaste_2022-03-31_10-47-29.png)
物理内存地址在物理地址空间中的分布
低256MB ：0x0000_0000-0x0fffffff
其余部分：0x90000000-0x17fffffff（共4GB-256MB）
这里物理内存共4GB
![Snipaste_2022-03-31_11-03-30.png](images/Snipaste_2022-03-31_11-03-30.png)
这也和qemu启动参数中分配给的4G内存对应上了

