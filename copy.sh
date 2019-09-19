#!/bin/bash

BASEDIR="$(dirname "$BASH_SOURCE")"
cd $BASEDIR

SD_BOOT=/run/media/r0zbot/BOOT/
SD_ROOT=/run/media/r0zbot/SYSTEM/

cp -rf data/labrador-linux/output/lib/modules $SD_ROOT/lib/
cp -f data/labrador-linux/output/* $SD_BOOT

sleep 1

umount -f SD_BOOT
umount -f SD_ROOT