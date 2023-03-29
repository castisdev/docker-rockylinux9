#!/bin/bash -e
set -x #echo on
cd ~
wget -nv https://go.dev/dl/go1.20.2.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.20.2.linux-amd64.tar.gz
rm -rf go1.20.2.linux-amd64.tar.gz
