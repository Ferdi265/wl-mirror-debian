FROM debian:bullseye

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential devscripts debhelper dh-make dh-cmake lintian

RUN apt-get update && apt-get install -y --no-install-recommends \
    git apt-file bash neovim

RUN apt-get update && apt-get install -y --no-install-recommends \
    cmake libwayland-dev libgles-dev

VOLUME /src
WORKDIR /src

CMD ./build.sh
