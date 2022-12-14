#!/bin/bash -e

mkdir -p build/ && cd build/

# get source
VERSION="${VERSION:-0.12.2}"
if [[ ! -f "wl-mirror_$VERSION.orig.tar.gz" ]]; then
    wget "https://github.com/Ferdi265/wl-mirror/releases/download/v$VERSION/wl-mirror-$VERSION.tar.gz" -O "wl-mirror_${VERSION}.orig.tar.gz"
fi

# prepare source package
tar xf "wl-mirror_${VERSION}.orig.tar.gz"
cp -r ../debian "wl-mirror-$VERSION/"
cd "wl-mirror-$VERSION/"

# build
debuild -us -uc
