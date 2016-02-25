#!/bin/sh

if [ ! -e linux-3.14-at6 -a ! -e atmark-dist-20160126 -a ! -e awl13-3.0.2-3 ]; then
    wget http://armadillo.atmark-techno.com/files/downloads/armadillo-iot/source/linux-3.14-at6.tar.gz
    wget http://armadillo.atmark-techno.com/files/downloads/armadillo-iot/source/atmark-dist-20160126.tar.gz
    wget http://armadillo.atmark-techno.com/files/downloads/armadillo-wlan/source/driver/AWL13/awl13-3.0.2-3.tar.gz

    tar zxf linux-3.14-at6.tar.gz
    tar zxf atmark-dist-20160126.tar.gz
    tar zxf awl13-3.0.2-3.tar.gz

    cd atmark-dist-20160126
    ln -s ../linux-3.14-at6 linux-3.x
    ln -s ../awl13-3.0.2-3 awl13
    cd ..
fi

cd atmark-dist-20160126
if [ ! -f atmark-dist-v20150727-add-python279.patch ]; then
    cd user
    mv python python.old
    wget http://download.atmark-techno.com/misc/forum/1561/atmark-dist-python279.tar.gz
    tar zxf atmark-dist-python279.tar.gz
    cd ..
    wget http://download.atmark-techno.com/misc/forum/1561/atmark-dist-v20150727-add-python279.patch
    patch -p1 < atmark-dist-v20150727-add-python279.patch
fi
