# README

This is a Docker image for build RavenLRS

https://github.com/RavenLRS/raven

## How to use

1. Installation

https://www.docker.com/products/docker-desktop

Software

Windows： Powershell

Linux or Mac: Terminal

Type the commands literally follow by $ prompt symbol.

2. Download image

```$ docker pull doskoi/ravenlrs```

3. Setup build enviroment

Create a new dictionray once the ternimal is opened.

```$ mkdir app```

```$ cd app```

```$ docker run --rm -v ${PWD}:/config -it doskoi/ravenlrs setup```

4. (Optional) Modify Configuration

Open the folder you just had created, to modifiy target files.

5.1.1 Compile (Upload separately)

```$ docker run --rm -v ${PWD}:/config -it doskoi/ravenlrs "TARGET=<target> make"```

5.1.2 Upload firmware (by 3rd tool)

https://github.com/marcelstoer/nodemcu-pyflasher/releases

Download the flasher to upload bin(firmware) file

5.2 Compile and upload firmware (Without 3rd tool)

```$ docker run --rm -v ${PWD}:/config -it doskoi/ravenlrs "TARGET=<target> PORT=<port> make"```

If you are running docker on Linux you can add --device=/dev/ttyUSB0 to your docker command to map a local USB device.

On macOS, Linux and Unix-like systems port must be the full port path e.g. /dev/tty.SLAB_USBtoUART
On Windows port must be specified by its number, e.g. COM10

6. Up to date

```$ docker run --rm -v ${PWD}:/config -it doskoi/ravenlrs "git pull"```

### Chinese version

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

https://github.com/marcelstoer/nodemcu-pyflasher/releases

下载单独的刷机软件刷上一步生成的bin文件


5.2 编译同时刷机

```$ docker run --rm -v ${PWD}:/config -it doskoi/ravenlrs "TARGET=<target> PORT=<port> make"```

PORT根据不同系统和不同电脑有变化，Windows通常是COM后面带数字如COM3，Linux和Mac 使用ls /dev/tty.* 查看可能的端口。

如果是Linux的系统还需要使用命令 --device=/dev/ttyUSB0（这个具体的端口根据上一步获得）使得Docker能够访问该USB设备。

6. 保持更新

```$ docker run --rm -v ${PWD}:/config -it doskoi/ravenlrs "git pull"```
