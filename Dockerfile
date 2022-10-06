FROM debian:bullseye

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential devscripts debhelper dh-make dh-cmake lintian

RUN apt-get update && apt-get install -y --no-install-recommends \
    git apt-file bash neovim

RUN apt-get update && apt-get install -y --no-install-recommends \
    cmake libwayland-dev libgles-dev scdoc

RUN passwd -d root
RUN groupadd -g 1000 user
RUN useradd -u 1000 -g 1000 -s /bin/bash user

VOLUME /src
WORKDIR /src

USER user

CMD ./build.sh
