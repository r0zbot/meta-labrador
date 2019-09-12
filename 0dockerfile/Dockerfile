FROM debian:buster

RUN apt-get update && apt-get install -y sudo make gcc git libncurses-dev gcc-arm-linux-gnueabihf u-boot-tools bc

RUN mkdir /data

WORKDIR /data

CMD ["tail", "-f", "/dev/null"]

