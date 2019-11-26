#!/bin/bash
set -e

cd $(dirname $0)

if [[ $1 == "kernel" ]]; then
    ./build.sh '&& make'
    ssh root@labrador "mount /dev/mmcblk0p1 /mnt/sd/boot || true"
    scp data/labrador-linux/output/uImage root@labrador:/mnt/sd/boot/
    scp data/labrador-linux/output/kernel.dtb root@labrador:/mnt/sd/boot/
    echo "Press enter to reboot"
    read
    ssh root@labrador 'reboot'
elif [[ $1 == "realtek" ]]; then
    ./build.sh '&& make realtek'
    ssh root@labrador "rmmod labrador_eth && rmmod realtek|| true"
    scp data/labrador-linux/linux/drivers/net/phy/realtek.ko root@labrador:/usr/lib/modules/4.14.13/kernel/drivers/net/phy/realtek.ko
    ssh root@labrador "insmod /usr/lib/modules/4.14.13/kernel/drivers/net/phy/realtek.ko" 
else
    ./build.sh
    ssh root@labrador "rmmod labrador_eth || true"
    scp data/labrador-linux/linux/drivers/net/ethernet/caninos/labrador_eth.ko root@labrador:/usr/lib/modules/4.14.13/kernel/drivers/net/ethernet/caninos/labrador_eth.ko
    ssh root@labrador "insmod /usr/lib/modules/4.14.13/kernel/drivers/net/ethernet/caninos/labrador_eth.ko" 
fi
