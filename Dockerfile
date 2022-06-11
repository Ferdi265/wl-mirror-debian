FROM debian:bullseye

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential devscripts debhelper dh-make dh-cmake

RUN apt-get update && apt-get install -y --no-install-recommends \
    git apt-file bash neovim

RUN apt-get update && apt-get install -y --no-install-recommends \
    cmake libwayland-dev libgles-dev

CMD bash -i
