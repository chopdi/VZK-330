sudo service klipper stop
cd ~/klipper
git pull

make clean KCONFIG_CONFIG=config.super8
make menuconfig KCONFIG_CONFIG=config.super8
make KCONFIG_CONFIG=config.super8
read -p "Super8 firmware built, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"

./scripts/flash-sdcard.sh /dev/ttyAMA0 mellow-super8
read -p "Super8 firmware flashed, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"

make clean KCONFIG_CONFIG=config.rpi
make menuconfig KCONFIG_CONFIG=config.rpi

make KCONFIG_CONFIG=config.rpi
read -p "RPi firmware built, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"
make flash KCONFIG_CONFIG=config.rpi

sudo service klipper start