# 关于debug版本的qemu获取方法：

拉取qemu，替换改动的文件，编译出debug版本。



# 关于调试qemu-system-loongarch64方法

先连上被调试的kernel，target remote：1234。

然后连上debug版本的qemu，查看qemu的进程号，然后本地管理员gdb调试qemu，输入进程号并连接。给qemu打上断点直接c，再回去运行kernel。

![image-20220524165440518](images/TODO-qemu-debug.assets/image-20220524165440518.png)



# 其它方便的指令。

![image-20220524175513168](images/TODO-qemu-debug.assets/image-20220524175513168.png)

