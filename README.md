# README

This is a Docker image for build RavenLRS

https://github.com/RavenLRS/raven

## How to use

 Compile (Upload separately)

```docker run --rm -v `pwd`:/home/src doskoi/ravenlrs "TARGET=<target> make"```

 Upload firmware

After success build, the command line will hint how to upload firmware by esptool,

But you still can do this by other tools.

Compile and upload firmware (Without 3rd tool)

```docker run --rm -v `pwd`:/home/src doskoi/ravenlrs "TARGET=<target> PORT=<port> make"```

If you are running docker on Linux you can add --device=/dev/ttyUSB0 to your docker command to map a local USB device.

On macOS, Linux and Unix-like systems port must be the full port path e.g. /dev/tty.SLAB_USBtoUART
On Windows port must be specified by its number, e.g. COM10
