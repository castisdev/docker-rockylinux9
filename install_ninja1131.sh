#!/bin/bash -e
set -x #echo on
source ${BUILD_TOOLSET_ENABLE}
cd ~
wget -nv --no-check-certificate --content-disposition https://github.com/skvadrik/re2c/releases/download/3.1/re2c-3.1.tar.xz
tar xvf re2c-3.1.tar.xz
cd re2c-3.1
mkdir .build && cd .build && cmake .. && cmake --build . -j$(nproc) --target install
cd ~
rm -rf re2c-3.1*

wget -nv https://github.com/ninja-build/ninja/archive/refs/tags/v1.13.1.tar.gz --no-check-certificate --content-disposition
tar xvf ninja-1.13.1.tar.gz
cd ninja-1.13.1
mkdir build;cd build;cmake ..;make install -j$(nproc)
cd ~
rm -rf ninja-*
