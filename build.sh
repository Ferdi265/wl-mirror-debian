#!/bin/sh

tar xf *.orig.tar.*
cd wl-mirror-*/
debuild -us -uc
