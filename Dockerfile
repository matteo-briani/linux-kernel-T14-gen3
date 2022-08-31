FROM ubuntu:22.04

RUN apt-get update; apt-get upgrade -y;
RUN apt-get update; apt-get install -y git wget build-essential bison flex libncurses-dev libssl-dev libelf-dev bc rsync kmod cpio zstd

RUN mkdir /builder
RUN cd /builder
WORKDIR /builder

RUN git clone --shallow-since=2022-08-01 https://github.com/torvalds/linux.git
RUN git config --global user.name "kernel patch"
RUN git config --global user.email "kernel.patch@no-reply.no"

COPY ./0001-Patch-i915.patch /builder
COPY ./ubuntu-based-general-kernel-config /builder
COPY ./launch.sh /builder

WORKDIR /builder
