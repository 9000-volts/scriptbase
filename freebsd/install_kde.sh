#!/bin/sh
# Installs K Desktop Environment for FreeBSD

# Install the required packages.
pkg install x11/kde4

# Keep backups of conf files.
echo "Storing backup of modified conf in ./bkp/install_kde"
mkdir -p bkp/install_kde/etc
cp /etc/rc.conf bkp/install_kde/etc/rc.conf

# Ensure required lines are present in conf files.
if ! grep -Fxq "dbus_enable=\"YES\"" /etc/rc.conf
then
	echo "dbus_enable=\"YES\"" > /etc/rc.conf
end

if ! grep -Fxq "hald_enable=\"YES\"" /etc/rc.conf
then
	echo "hald_enable=\"YES\"" > /etc/rc.conf
end

if ! grep -Fxq "kdm4_enable=\"YES\"" /etc/rc.conf
then
	echo "kdm4_enable=\"YES\"" /etc/rc.conf
end
