#!/bin/bash

pacman -Sy --noconfirm wget
curl "https://raw.githubusercontent.com/flatcar-linux/init/flatcar-master/bin/flatcar-install" > flatcar-install
chmod +x flatcar-install
./flatcar-install -d /dev/sda -C stable -i payload/ignition.json
reboot
