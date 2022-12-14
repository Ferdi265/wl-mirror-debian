ARG BASE=debian:bookworm
FROM $BASE

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential wget devscripts lintian \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y --no-install-recommends \
    debhelper-compat dh-cmake cmake scdoc libwayland-dev libgles-dev \
    && rm -rf /var/lib/apt/lists/*

RUN passwd -d root
RUN groupadd -g 1000 user
RUN useradd -u 1000 -g 1000 -s /bin/bash user

VOLUME /src
WORKDIR /src

USER user

CMD ./build.sh
