#!/bin/bash -e

cd build/

# lint debs
for f in *.deb; do
    echo ">> $f"
    lintian "$f" || true
done
