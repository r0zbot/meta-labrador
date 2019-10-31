#!/bin/bash
set -e

cd $(dirname $0)

./build.sh
ssh root@192.168.192.210 "rmmod labrador_eth || true"
scp data/labrador-linux/linux/drivers/net/ethernet/caninos/labrador_eth.ko root@192.168.192.210:/usr/lib/modules/4.14.13/kernel/drivers/net/ethernet/caninos/labrador_eth.ko
ssh root@192.168.192.210 "insmod /usr/lib/modules/4.14.13/kernel/drivers/net/ethernet/caninos/labrador_eth.ko" 
