1. 安装Docker

https://www.docker.com/products/docker-desktop

软件

Windows： Powershell

Linux or Mac: Terminal

```$ 后的字符是要输入的命令```

2. 下载镜像

```$ docker pull doskoi/ravenlrs```

3. 执行命令运行编译环境

打开对应的软件以后新建一个空目录用于后续操作

```$ mkdir app```

```$ cd app```

```$ docker run --rm -v ${PWD}:/config -it doskoi/ravenlrs setup```

4.(可选)修改配置文件

打开刚才用命令创建的文件夹，修改配置文件

5.1.1 编译（需单独使用软件刷bin固件文件）

```$ docker run --rm -v ${PWD}:/config -it doskoi/ravenlrs "TARGET=<target> make"```

5.1.2 使用工具刷机

当成功编译以后，命令行会提示如何使用esptool命令刷机，

但你也可以复制出后缀为.bin的固件文件，使用第三方软件进行刷机。


5.2 编译同时刷机

```$ docker run --rm -v ${PWD}:/config -it doskoi/ravenlrs "TARGET=<target> PORT=<port> make"```

PORT根据不同系统和不同电脑有变化，Windows通常是COM后面带数字如COM3，Linux和Mac 使用ls /dev/tty.* 查看可能的端口。

如果是Linux的系统还需要使用命令 --device=/dev/ttyUSB0（这个具体的端口根据上一步获得）使得Docker能够访问该USB设备。

6. 保持更新

```$ docker run --rm -v ${PWD}:/config -it doskoi/ravenlrs "git pull"```

### [English version](README.md)