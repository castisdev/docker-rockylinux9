#!/bin/sh -e
set -x #echo on
# dnf module install -y python39
dnf install -y python3-pip
dnf -y clean all
pip3 install -U pip setuptools websocket-client
