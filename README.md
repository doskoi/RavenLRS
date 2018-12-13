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

5.1.2 Upload firmware

After success build, the command line will hint how to upload firmware by esptool,

But you still can do this by other tools.

5.2 Compile and upload firmware (Without 3rd tool)

```$ docker run --rm -v ${PWD}:/config -it doskoi/ravenlrs "TARGET=<target> PORT=<port> make"```

If you are running docker on Linux you can add --device=/dev/ttyUSB0 to your docker command to map a local USB device.

On macOS, Linux and Unix-like systems port must be the full port path e.g. /dev/tty.SLAB_USBtoUART
On Windows port must be specified by its number, e.g. COM10

6. Up to date

```$ docker run --rm -v ${PWD}:/config -it doskoi/ravenlrs "git pull"```

### [Chinese version 中文](README_CN.md)