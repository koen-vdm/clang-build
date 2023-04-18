FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update
# install dependencies for LLVM
RUN apt install -y lsb-release wget software-properties-common gnupg 
# install LLVM compiler
RUN bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"
# optionally install development tools
ARG DEVELOPMENT
RUN if [ "$DEVELOPMENT" = true]; then apt instal git; fi