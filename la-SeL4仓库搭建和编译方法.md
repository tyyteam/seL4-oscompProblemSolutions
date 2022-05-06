创建并进入sel4test目录，用repo命令获取官方库：

```
mkdir sel4test
cd sel4test
repo init -u https://github.com/seL4/sel4test-manifest.git
repo sync
```

在sel4test目录下，用wget获取并执行init_loongarch_seL4-test_dev.sh：

```
wget home.ustc.edu.cn/~le24/shell/init_loongarch_seL4-test_dev.sh
chmod u+x init_loongarch_seL4-test_dev.sh
./init_loongarch-seL4-test_dev.sh ssh
```

在sel4test目录下，创建build_3A5000文件夹：

```
mkdir build_3A5000
cd build_3A5000
../init-build.sh -DPLATFORM=3A5000 -DLoongarch64=1 -DSIMULATION=1
```

编译：

```
ninja
```



在编译过程中，可能缺少库，官方建议安装好这些库：[Host Dependencies | seL4 docs](https://docs.sel4.systems/projects/buildsystem/host-dependencies.html)。



报错的文件在：kernel/src/drivers/serial/loongson3A5000-uart.c

