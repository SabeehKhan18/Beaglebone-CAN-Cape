# This script is for setting up the bone's gpio. 
# It is based on the following website: 
# http://www.embedded-things.com/bbb/enable-canbus-on-the-beaglebone-black/
# The device tree was not used as the CAN bus was already enabled via config-pin.
#!/bin/bash

modprobe can
modprobe can-dev
modprobe can-raw

config-pin -a P8_13 gpio
config-pin -a P8_13 out
config-pin -a P8_13 low
config-pin -a P9_26 can
config-pin -a P9_24 can

if [[ $# -eq 0 ]] ; then
	echo 'Baudrate not given, please give one:'
    read baud
	ip link set can1 up type can bitrate $baud
else
	ip link set can1 up type can bitrate $1
fi

ifconfig can1 up
