#!/bin/bash

BASEDIR="$(dirname "$BASH_SOURCE")"
cd $BASEDIR

SD_BLK=/dev/sdc

SD_BOOT=/mnt/labrador/boot
SD_ROOT=/mnt/labrador/root

mkdir -p /mnt/labrador/boot
mkdir -p /mnt/labrador/root

mount ${SD_BLK}1 $SD_BOOT
mount ${SD_BLK}2 $SD_ROOT

cp -rf data/labrador-linux/output/lib/modules $SD_ROOT/lib/
cp -f data/labrador-linux/output/* $SD_BOOT

sleep 2

umount -f $SD_BOOT
umount -f $SD_ROOT