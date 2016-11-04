# This script is for setting up the device tree overlay 
# It is based on the following website: 
# http://www.embedded-things.com/bbb/enable-canbus-on-the-beaglebone-black/
#!/bin/bash
modprobe can
modprobe can-dev
modprobe can-raw

config-pin -a P8_13 gpio
config-pin -a P8_13 out
config-pin -a P8_13 low
config-pin -a P9_26 can
config-pin -a P9_24 can

ip link set can1 up type can bitrate $1
ifconfig can1 up
