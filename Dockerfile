FROM ubuntu:22.04

RUN apt-get update; apt-get upgrade -y;
RUN apt-get update; apt-get install -y git wget build-essential bison flex libncurses-dev libssl-dev libelf-dev

