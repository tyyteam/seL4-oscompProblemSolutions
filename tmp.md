# porting

seL4网站：[Porting seL4 to a new platform ](https://docs.sel4.systems/projects/sel4/porting)。

FAQ：[Frequently Asked Questions on seL4 ](https://docs.sel4.systems/projects/sel4/frequently-asked-questions.html)。

[Tutorials | seL4 docs](https://docs.sel4.systems/Tutorials/)。感觉这里面的seL4 mechanisms tutorials有点用。

libsel4 API：[API Reference | seL4 docs](https://docs.sel4.systems/projects/sel4/api-doc.html)。

## Porting seL4 to a new platform

根据网页：[Porting seL4 to a new platform ](https://docs.sel4.systems/projects/sel4/porting)。

tree命令，将当前目录打印到某文件。

```
tree [-L n]> fileTree.txt #-L n为限制层级，e.g.-L 2，重定向输出至fileTree.txt
```

根目录：

```
.
├── build
├── CAVEATS-generic.md
├── CAVEATS-ia32.md
├── CHANGES
├── CMakeLists.txt
├── CODE_OF_CONDUCT.md
├── config.cmake
├── configs
├── CONTRIBUTING.md
├── CONTRIBUTORS.md
├── FindseL4.cmake
├── gcc.cmake
├── gdb-macros
├── include
├── libsel4 #libsel4/sel4_plat_include/<platform>/sel4/plat/api/constants.h
├── LICENSE.md
├── LICENSES
├── llvm.cmake
├── manual
├── README.md
├── src
├── tools
├── treefile.txt
└── VERSION
```

* DTS修改：在tools/dts/update-dts.sh
* Hardware generation script修改：在tools/hardware.yml
  * Drivers：/src/drivers/
  * Drivers：/include/drivers/
* kernel：在libsel4/sel4_plat_include/\<platform>/sel4/plat/api/constants.h添加支持

* CMake-Build System：在kernel/src/plat/\<platform>/config.cmake，以及tools/seL4/cmake-tool/helpers/application_settings.cmake，还有tools/seL4/elfloader-tool/CMakeLists.txt
* elf-loader：在tools/seL4/elfloader-tool/src/plat/\<platform>/sys_fputc.c，以及tools/seL4/elfloader-tool/include/plat/\<platform>/platform.h
* seL4test：在sel4test/projects/util_libs/libplatsupport/plat_include/\<platform>/platsupport/plat下添加头文件支持，在sel4test/projects/util_libs/libplatsupport/src/plat/\<platform>/下添加相应源文件。

## tutorials部分

参考网址：[Tutorials | seL4 docs](https://docs.sel4.systems/Tutorials/)。

先建立文件夹：

```
mkdir sel4-tutorials-manifest
cd sel4-tutorials-manifest
repo init -u https://github.com/seL4/sel4-tutorials-manifest
repo sync
```

在文件夹下，输入如下命令，查看相应的内容，选择参数，自动生成文件。

```
./init -h
```

例如：

```
./init --tut hello-world # 自动生成hello-world，hello-world_build
cd hello-world
ninja
./simulate
```

### seL4 mechanisms tutorials

capabilities：类似于句柄？

CNodes：类似于capabilities的数组？

CSlots：类似于CNodes中每个元素指针？

CSpace：属于一个线程的capability地址范围。

















# 安装龙芯的qemu

[qemu linux 命令 在线中文手册 (51yip.com)](http://linux.51yip.com/search/qemu)。

参考网址：

* [qemu/target/loongarch at tcg-dev · yangxiaojuan-loongson/qemu (github.com)](https://github.com/yangxiaojuan-loongson/qemu/tree/tcg-dev/target/loongarch)。
  * 装qemu时：需要下载他给的tcg-dev版本，或者git clone仓库再切换分支，注意其他分支是没有loongarch架构的。用户态，安装，然后暂时可以运行。系统态，从他给的binary仓库中好像有问题，老师在解决。
* https://github.com/sunhaiyong1978/CLFS-for-LoongArch/blob/main/Qemu_For_LoongArch64-Simple.md。
  * 这里面只有用户态。然后挺复杂？

ftp://182.92.153.183/uploads/qemu/clfs.img.xz，下载解压后，参考ftp://182.92.153.183/uploads/qemu/run-clfs.sh启动模拟器，可以进行系统，root密码为loongson。目前还有个小问题，systemd-resolved启动报错，不过重试几次后系统会放弃不影响启动。



这个系统是https://github.com/sunhaiyong1978/CLFS-for-LoongArch/，龙芯孙海勇做的从头构建linux的系统，他还写了一本手把手教clfs的书，有兴趣也可以去看看

Loongarch的操作系统开源的有loongnix（loongnix.cn），阿里的龙蜥和华为欧拉社区也在加入支持；商业的有麒麟和统信等。不过目前有个困难：loongarch的工具链ABI接口还在变化，和现有商业的不完全一致，目前最新的社区linux内核、工具链和bios并不兼容已有的loongnix和商业系统，可能会带来一些额外的麻烦。我这几天组织相关人员把模拟器上的一整套系统从源代码到二进制重新整理一遍，写个更系统些的文档供大家参考



上午那个clfs个头太大，刚刚基于busybox做了一个ramdisk，常见的命令都有才1M多，已经上传到ftp server 182.92.153.183的uploads/qemu/initrd.img, 相应的启动命令参考同目录的run.sh（具体路径可能需要根据自己的配置修改下）



制作方法参考：https://gist.github.com/chrisdone/02e165a0004be33734ac2334f215380e







# 反汇编elf,以及elf为什么好多？





# initrd -kernel -bios -hda -append参数的区别？























