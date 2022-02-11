FROM ubuntu:20.04

LABEL maintainer="jose.macchi@gmail.com"

RUN apt update && apt -y install wget libc-ares2 libmediainfo0v5 libpcrecpp0v5 libzen0v5 

RUN wget -c https://mega.nz/linux/repo/xUbuntu_20.04/amd64/megacmd_1.5.0-7.1_amd64.deb &&\
    dpkg -i megacmd_1.5.0-7.1_amd64.deb &&\
    rm megacmd_1.5.0-7.1_amd64.deb
