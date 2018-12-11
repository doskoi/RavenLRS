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

VOLUME /config
WORKDIR /usr/src/app
ENV APPDIR /usr/src/app

# Setup esp32 SDK
RUN git clone https://github.com/espressif/esp-idf.git
WORKDIR ${APPDIR}/esp-idf
# Checkout branch for raven
RUN git checkout v3.0 && git submodule init && git submodule update -r
# Set env viriable
ENV IDF_PATH ${APPDIR}/esp-idf

WORKDIR ${APPDIR}
# Download and setup esp32 toolchain
RUN wget https://dl.espressif.com/dl/xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz
RUN tar -xzf xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz
RUN rm xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz
ENV PATH=$PATH:${APPDIR}/xtensa-esp32-elf/bin

# Setup Raven
WORKDIR ${APPDIR}
RUN git clone --recursive https://github.com/RavenLRS/raven.git
# WORKDIR ${APPDIR}/raven
WORKDIR /config/raven

COPY setup /usr/local/bin

ENTRYPOINT ["/bin/sh", "-c"]
CMD ["make", "--help"]

# RUN make