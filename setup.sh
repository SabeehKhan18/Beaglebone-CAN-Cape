# This script is for setting up the device tree overlay 
# It is based on the following website: 
# http://www.embedded-things.com/bbb/enable-canbus-on-the-beaglebone-black/
#!/bin/bash
sudo su
dtc -O dtb -o BB-DCAN1-00A0.dtbo -b 0 -@ BB-DCAN1-00A0.dts
sudo cp BB-DCAN1-00A0.dtbo /lib/firmware
echo BB-DCAN1 > /sys/devices/platform/bone_capemgr/slots
modprobe can
modprobe can-dev
modprove can-raw

sudo ip link set can0 up type can bitrate 500000
sudo ifconfig can0 up
