#!/bin/sh

#if [ ! -f python2.7-minimal_2.7.3-6+deb7u2_armel.deb -a ! -f python-minimal_2.7.3-4+deb7u1_all.deb -a ! -f python2.7_2.7.3-6+deb7u2_armel.deb -a ! -f python_2.7.3-4+deb7u1_all.deb ]; then
#    wget http://ftp.jp.debian.org/debian/pool/main/p/python2.7/python2.7-minimal_2.7.3-6+deb7u2_armel.deb
#    wget http://ftp.jp.debian.org/debian/pool/main/p/python-defaults/python-minimal_2.7.3-4+deb7u1_all.deb
#    wget http://ftp.jp.debian.org/debian/pool/main/p/python2.7/python2.7_2.7.3-6+deb7u2_armel.deb
#    wget http://ftp.jp.debian.org/debian/pool/main/p/python-defaults/python_2.7.3-4+deb7u1_all.deb
#fi

if [ ! -f python-gi-cairo_3.2.2-2_armel.deb -a ! -f python-gi-dev_3.18.2-2_armel.deb -a ! -f python-gi_3.2.2-2_armel.deb -a ! -f python-gobject-2_2.28.6-10_armel.deb -a ! -f python-gobject_3.2.2-2_all.deb -a ! -f python-gobject-dev_3.2.2-2_all.deb ]; then
    wget http://ftp.jp.debian.org/debian/pool/main/p/pygobject/python-gi-cairo_3.2.2-2_armel.deb
#    wget http://ftp.jp.debian.org/debian/pool/main/p/pygobject/python-gi-dev_3.18.2-2_armel.deb
    wget http://ftp.jp.debian.org/debian/pool/main/p/pygobject/python-gi_3.2.2-2_armel.deb
    wget http://ftp.jp.debian.org/debian/pool/main/p/pygobject-2/python-gobject-2_2.28.6-10_armel.deb
    wget http://ftp.jp.debian.org/debian/pool/main/p/pygobject/python-gobject_3.2.2-2_all.deb
#    wget http://ftp.jp.debian.org/debian/pool/main/p/pygobject/python-gobject-dev_3.2.2-2_all.deb
fi

if [ ! -f gir1.2-freedesktop_1.46.0-3_armel.deb -a ! -f gir1.2-glib-2.0_1.46.0-3_armel.deb -a ! -f gobject-introspection_1.46.0-3_armel.deb -a ! -f libgirepository-1.0-1_1.46.0-3_armel.deb -a ! -f libgirepository1.0-dev_1.46.0-3_armel.deb ]; then
#    wget http://ftp.jp.debian.org/debian/pool/main/g/gobject-introspection/gir1.2-freedesktop_1.46.0-3_armel.deb
#    wget http://ftp.jp.debian.org/debian/pool/main/g/gobject-introspection/gir1.2-glib-2.0_1.46.0-3_armel.deb
    wget http://ftp.jp.debian.org/debian/pool/main/g/gobject-introspection/gobject-introspection_1.46.0-3_armel.deb
    wget http://ftp.jp.debian.org/debian/pool/main/g/gobject-introspection/libgirepository-1.0-1_1.46.0-3_armel.deb
#    wget http://ftp.jp.debian.org/debian/pool/main/g/gobject-introspection/libgirepository1.0-dev_1.46.0-3_armel.deb
fi

if [ ! -e dpkg_dir ]; then
    mkdir dpkg_dir
fi

cd dpkg_dir
rm -rf *
cd ..

#dpkg -x python2.7-minimal_2.7.3-6+deb7u2_armel.deb dpkg_dir
#dpkg -x python-minimal_2.7.3-4+deb7u1_all.deb dpkg_dir
#dpkg -x python2.7_2.7.3-6+deb7u2_armel.deb dpkg_dir
#dpkg -x python_2.7.3-4+deb7u1_all.deb dpkg_dir

dpkg -x python-gi-cairo_3.2.2-2_armel.deb dpkg_dir
#dpkg -x python-gi-dev_3.18.2-2_armel.deb dpkg_dir
dpkg -x python-gi_3.2.2-2_armel.deb dpkg_dir
dpkg -x python-gobject-2_2.28.6-10_armel.deb dpkg_dir
dpkg -x python-gobject_3.2.2-2_all.deb dpkg_dir
#dpkg -x python-gobject-dev_3.2.2-2_all.deb dpkg_dir

#dpkg -x gir1.2-freedesktop_1.46.0-3_armel.deb dpkg_dir
#dpkg -x gir1.2-glib-2.0_1.46.0-3_armel.deb dpkg_dir
dpkg -x gobject-introspection_1.46.0-3_armel.deb dpkg_dir
dpkg -x libgirepository-1.0-1_1.46.0-3_armel.deb dpkg_dir
#dpkg -x libgirepository1.0-dev_1.46.0-3_armel.deb dpkg_dir

cp -ar dpkg_dir/* atmark-dist-20160126/romfs

if [ ! -e pip_dir ]; then
    mkdir pip_dir
fi

cd pip_dir
rm -rf *
cd ..

if [ ! -e /usr/bin/pip ]; then
  sudo apt-get install python-pip
fi

pip install -t pip_dir websocket-client
pip install -t pip_dir linux_metrics

mkdir -p atmark-dist-20160126/romfs/usr/local/lib/python2.7/dist-packages
cp -ar pip_dir/* atmark-dist-20160126/romfs/usr/local/lib/python2.7/dist-packages
