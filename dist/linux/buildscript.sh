#!/bin/bash
mkdir -p /WORKDIR/dodhooks/build
rm -rf /WORKDIR/dodhooks/build/*
cd /WORKDIR/dodhooks/build/

python3 ../configure.py --hl2sdk-root=/WORKDIR/ --sm-path=/WORKDIR/sourcemod/ --mms-path=$(find /WORKDIR -type d -regex ".*mmsource.*")
ambuild
cp -rf /WORKDIR/dodhooks/sourcemod/* /WORKDIR/dodhooks/build/package/addons/sourcemod/
