#!/bin/sh
# Installs Wacom Drivers for FreeBSD

# Install the required packages.
pkg install -y xf86-input-wacom webcamd xorg-server

# Keep backups of conf files.
echo "Storing backup of modified conf in ./bkp/install_wacom"
mkdir -p bkp/install_wacom/boot bkp/install_wacom/etc
cp /boot/loader.conf bkp/install_wacom/boot/loader.conf
cp /etc/rc.conf bkp/install_wacom/etc/rc.conf

# Ensure required lines are present in conf files.
if ! grep -Fxq "cuse4bsd_load=\"YES\"" /boot/loader.conf
then
	echo "cuse4bsd_load=\"YES\"" >> /boot/loader.conf
fi

if ! grep -Fxq "devd_enable=\"YES\"" /etc/rc.conf
then
	echo "devd_enable=\"YES\"" >> /etc/rc.conf
fi

if ! grep -Fxq "hald_enable=\"YES\"" /etc/rc.conf
then
	echo "hald_enable=\"YES\"" >> /etc/rc.conf
fi

if ! grep -Fxq "webcamd_enable=\"YES\"" /etc/rc.conf
then
	echo "webcamd_enable=\"YES\"" >> /etc/rc.conf
fi

