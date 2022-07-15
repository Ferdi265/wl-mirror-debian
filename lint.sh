#!/bin/sh

for f in *.deb; do
    echo ">> $f"
    lintian "$f"
done
