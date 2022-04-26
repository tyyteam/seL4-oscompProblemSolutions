# sel4test-tyyteam-创建仓库、拉取更新或推送更新

tyyteam在其github organization中fork了sel4test项目，用于移植seL4-LA的内容。sel4test涉及到多个仓库，此文档帮助你创建仓库、拉取更新或推送更新。

## sel4test仓库创建

创建sel4test文件夹，并在sel4test文件夹下执行脚本。

```
mkdir sel4test & cd sel4test
wget https://raw.githubusercontent.com/GooTal/seL4_shell_scripts/master/sel4test-set_and_pull.sh
chmod u+x sel4test-set_and_pull.sh
./sel4test-set_and_pull.sh
```

然后你的sel4test仓库创建完毕。

## sel4test仓库更新

在sel4test文件夹下，运行脚本。

```
./sel4test-set_and_pull.sh
```

然后你的sel4test仓库更新完毕。

## sel4test仓库修改

你可以直接在命令行中使用`git push`命令。

也可以参考雷哥手册：https://github.com/tyyteam/seL4-oscompProblemSolutions/blob/leiyang/04.11

```
wget home.ustc.edu.cn/~le24/shell/update_seL4-test_dev.sh
chmod u+x update_seL4-test_dev.sh
./update_seL4-test_dev.sh commit message
```

## 构建loongarch项目

参考雷哥手册：https://github.com/tyyteam/seL4-oscompProblemSolutions/blob/leiyang/04.11

```
mkdir build_3A5000
cd build_3A5000
../init-build.sh -DPLATFORM=3A5000 -DLoongarch64=1 -DSIMULATION=1
```

