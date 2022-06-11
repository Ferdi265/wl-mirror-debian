#!/bin/bash -x

sudo docker build -t wl-mirror-debuild .
sudo docker run --rm -it -v "$PWD:/src" --env-file=.env wl-mirror-debuild "$@"
