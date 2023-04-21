FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update
# install general tools
RUN apt install -y unzip curl
# install AWS tools
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && unzip awscliv2.zip && rm awscliv2.zip
RUN ./aws/install
# install CMake and dependancies 
RUN apt install -y cmake build-essential ninja-build gcc-arm-none-eabi
# install dependencies for LLVM
RUN apt install -y lsb-release wget software-properties-common gnupg libgtk-3-dev
# install LLVM compiler
RUN bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"
RUN ln /usr/bin/clang-15 /usr/bin/clang && ln /usr/bin/clang-cpp-15 /usr/bin/clang-cpp && ln /usr/bin/clangd-15 /usr/bin/clangd && ln /usr/bin/clang++-15 /usr/bin/clang++
##### todo: delete the following section after verifying that /lib/gcc-arm-none-eabi (which is proably installed by llvm.sh) suffices
# install arm-none-eabi cross compiler 
# RUN wget https://developer.arm.com/-/media/Files/downloads/gnu-rm/10.3-2021.10/gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2
# RUN tar -xvf gcc-arm-none-eabi-*
# RUN find . -name "gcc-arm-none-eabi-*.tar*" -delete

######## to be removed upon release
# install development tools
RUN apt install -y git nano
ENTRYPOINT ["tail", "-f", "/dev/null"]
COPY setup.sh /root/setup.sh