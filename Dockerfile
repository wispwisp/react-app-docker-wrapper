FROM ubuntu:latest

RUN apt update && apt install -y wget xz-utils git

ARG VERSION=v18.12.1
ARG DISTRO=linux-x64
ARG ARCHIVE=node-$VERSION-$DISTRO.tar.xz

RUN wget https://nodejs.org/dist/$VERSION/$ARCHIVE

COPY ./checksums /

RUN sha256sum -c --status checksums && \
  mkdir -p /usr/local/lib/nodejs && \
  tar -xJvf $ARCHIVE -C /usr/local/lib/nodejs && \
  rm $ARCHIVE

RUN useradd -ms /bin/bash me
USER me
WORKDIR /home/me

RUN echo "export PATH=/usr/local/lib/nodejs/node-$VERSION-$DISTRO/bin:$PATH" >> /home/me/.bashrc

