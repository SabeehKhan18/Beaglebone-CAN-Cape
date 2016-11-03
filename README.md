# Beaglebone CAN Cape
Simple CAN cape for the Beaglebone Black

Installation guide:
Clone this repository on your beaglebone and then log into root. The following commands are all in the terminal. 
Be sure you have disabled the HDMI in /boot/uEnv.txt by uncommenting:

`dtb=am335x-boneblack-emmc-overlay.dtb`

Also install linux can-utils:

`apt-get install can-utils`

Begin setup by sourcing the setup bash file:

`source setup.sh`

You can now grab CAN data by:

`candump can1'
