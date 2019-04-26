FROM debian:buster

# Get packages for build
RUN apt-get update && apt install -y \
    build-essential \
    git \
    wget \
    make \
    libncurses-dev \
    flex \
    bison \
    gperf \
    python \
    python-serial \
    python-pip \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

VOLUME /home/src
WORKDIR /usr/src/app
ENV APPDIR /usr/src/app

WORKDIR ${APPDIR}
# Download and setup esp32 toolchain
RUN wget https://dl.espressif.com/dl/xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz
RUN tar -xzf xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz
RUN rm xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz
ENV PATH=$PATH:${APPDIR}/xtensa-esp32-elf/bin

# Setup Raven by run setup script
WORKDIR /home/src

ENTRYPOINT ["/bin/sh", "-c"]
CMD ["make", "--help"]

# RUN make
