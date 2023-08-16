FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update
# install general tools
RUN apt install -y wget xz-utils bzip2
# install clang tools
RUN apt install -y libncurses5 make
RUN wget -O /root/arm-none-eabi.tar.bz2 "https://developer.arm.com/-/media/Files/downloads/gnu-rm/7-2018q2/gcc-arm-none-eabi-7-2018-q2-update-linux.tar.bz2"
RUN tar -xf "/root/arm-none-eabi.tar.bz2" -C /root
RUN wget -O /root/clang.tar.xz "https://github.com/llvm/llvm-project/releases/download/llvmorg-10.0.0/clang+llvm-10.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz"
RUN tar -xf "/root/clang.tar.xz" -C /root
ENV PATH="/root/clang+llvm-10.0.0-x86_64-linux-gnu-ubuntu-18.04/bin:$PATH"

######## to be removed upon release
# install development tools
RUN apt install -y git nano
ENTRYPOINT ["tail", "-f", "/dev/null"]
COPY setup.sh /root/setup.sh