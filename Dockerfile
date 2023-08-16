FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update
# install general tools
RUN apt install -y wget xz-utils
# install clang tools
RUN wget "https://github.com/llvm/llvm-project/releases/download/llvmorg-10.0.0/clang+llvm-10.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz"
RUN tar -xf "./clang+llvm-10.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz"
RUN export PATH=`pwd`/clang+llvm-10.0.0-x86_64-linux-gnu-ubuntu-18.04/bin:$PATH

######## to be removed upon release
# install development tools
RUN apt install -y git nano
ENTRYPOINT ["tail", "-f", "/dev/null"]
COPY setup.sh /root/setup.sh