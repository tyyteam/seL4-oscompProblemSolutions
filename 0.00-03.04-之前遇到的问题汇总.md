# Virtual Box初始分配空间不够
https://blog.csdn.net/benben0503/article/details/113865502

以Virtual Box 6.1.32 r149290（Qt5.6.2）版本为例

1. 管理->虚拟介质管理![t](/images/x.xx-3.4/img1.png) 

可调节分配磁盘大小(需要在虚拟机关闭的情况下)

2. 下载gparted，然后挂载分区

# 磁盘空间不够导致无法进入系统
启动虚拟机后按shift进入recover mode root模式

删除一定的文件释放空间，之后重启即可

# 特定情况（例如上面的情况root模式下）中文文件/文件夹名称乱码且不能复制，导致无法进入指定文件夹

命令行键入
```
export LANG=en_us
```

可以将中文变为编码，即可通过键盘输入

# 删除文件过程出现read-only无法删除

重新挂载磁盘，重启即可，如何挂载请百度

# 安装的qemu无主窗口，终端显示VNC server running on 127.0.0.1:XXXX

缺少依赖库，导致qemu配置文件configure没有开启SDL选项，命令行键入
```
sudo apt-get install libsdl1.2-dev
```

下载成功后重新编译qemu和安装即可（可运行configure观察终端输入log中SDL是否成功开启）

# repo init（或其他clone git仓库情况）出现server certificate verification failed

证书校验问题，设置环境变量解决（单次有效），命令行键入
```
export GIT_SSL_NO_VERIFY=1
```

一劳永逸的方法
https://blog.csdn.net/GooTal/article/details/123196199
（qingtao的blog）

