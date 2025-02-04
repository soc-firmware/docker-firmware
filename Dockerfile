# 📦 firmware Docker Builder - Dockerfile

# Use an official Ubuntu base image
FROM ubuntu:22.04

# Set non-interactive mode for apt
ENV DEBIAN_FRONTEND=noninteractive

# Install required dependencies
RUN apt-get update && apt-get install -y \
    gawk wget git-core diffstat unzip texinfo gcc-multilib \
    build-essential chrpath socat cpio python3 python3-pip \
    python3-pexpect xz-utils debianutils iputils-ping \
    python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev \
    xterm sudo cmake gcc-arm-none-eabi libnewlib-arm-none-eabi \
    && rm -rf /var/lib/apt/lists/*

# Create a non-root user
RUN useradd -m -s /bin/bash builder && \
    echo 'builder ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/builder

# Set working directory
WORKDIR /home/builder

# Switch to the non-root user
USER builder

# Set environment variables
ENV firmware_DIR=/home/builder/firmware-build
ENV PICO_SDK_PATH=/home/builder/pico-sdk

# Create build directory
RUN mkdir -p ${firmware_DIR} && \
    echo "export firmware_DIR=${firmware_DIR}" >> ~/.bashrc

# Clone the Raspberry Pi Pico SDK
RUN git clone -b master https://github.com/raspberrypi/pico-sdk.git ${PICO_SDK_PATH} && \
    cd ${PICO_SDK_PATH} && \
    git submodule update --init

# Initialize the SDK
RUN cd ${PICO_SDK_PATH} && \
    mkdir -p build && \
    cd build && \
    cmake ..

# Set up SDK environment
RUN echo "export PICO_SDK_PATH=${PICO_SDK_PATH}" >> ~/.bashrc && \
    echo "source ${PICO_SDK_PATH}/external/pico_sdk_import.cmake" >> ~/.bashrc

# Set entrypoint to bash
ENTRYPOINT ["/bin/bash"]