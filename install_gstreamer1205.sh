#!/bin/bash -e
set -x #echo on
cd ~
pip3 install meson
yum -y install flex bison; yum -y clean all
wget -nv --no-check-certificate --content-disposition https://github.com/GStreamer/gstreamer/archive/refs/tags/1.20.5.tar.gz
tar xf gstreamer-1.20.5.tar.gz
cd gstreamer-1.20.5
meson -Dlibsoup:c_std=gnu99 build
meson install -C build
ldconfig
cd ~
rm -rf gstreamer-1.20.5*