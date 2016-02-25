#!/bin/sh

if [ ! -e linux-3.14-at6 -a ! -e atmark-dist-20160126 -a ! -e awl13-3.0.2-3 ]; then
    wget http://armadillo.atmark-techno.com/files/downloads/armadillo-iot/source/linux-3.14-at6.tar.gz
    wget http://armadillo.atmark-techno.com/files/downloads/armadillo-iot/source/atmark-dist-20160126.tar.gz
    wget http://armadillo.atmark-techno.com/files/downloads/armadillo-wlan/source/driver/AWL13/awl13-3.0.2-3.tar.gz
    wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/ejdk/8u73-b02/ejdk-8u73-linux-arm-sflt.tar.gz"

    tar zxf linux-3.14-at6.tar.gz
    tar zxf atmark-dist-20160126.tar.gz
    tar zxf awl13-3.0.2-3.tar.gz
    tar zxf ejdk-8u73-linux-arm-sflt.tar.gz

    cd atmark-dist-20160126
    ln -s ../linux-3.14-at6 linux-3.x
    ln -s ../awl13-3.0.2-3 awl13
    ln -s ../ejdk1.8.0_73 ejdk
fi

if [ ! -f atmark-dist-v20150727-add-python279.patch ]; then
    cd user
    mv python python.old
    wget http://download.atmark-techno.com/misc/forum/1561/atmark-dist-python279.tar.gz
    tar zxf atmark-dist-python279.tar.gz
    cd ..
    wget http://download.atmark-techno.com/misc/forum/1561/atmark-dist-v20150727-add-python279.patch
    patch -p1 < atmark-dist-v20150727-add-python279.patch
fi
cd

