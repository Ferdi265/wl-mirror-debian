#!/bin/bash -e

if [[ $# -gt 0 && $1 == --base ]]; then
    if [[ $# -lt 2 ]]; then
        echo "usage: docker.sh [--base BASE_IMAGE] [cmd]"
        exit 1
    fi

    opt=--build-arg; arg="BASE=$2"
    shift; shift
else
    opt=; arg=
fi

# build and run container
sudo docker build $opt $arg -t wl-mirror-debuild .
sudo docker run --rm -it -v "$PWD:/src" --env-file=.env wl-mirror-debuild "$@"
