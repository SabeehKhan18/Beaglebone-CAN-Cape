# Beaglebone CAN Cape
Simple CAN cape for the Beaglebone Black

Installation guide:
== Installation Instructions ==

The installation of this project is relatively simple. First, begin by cloning the github repository:

`beagle$ git clone https://github.com/SabeehKhan18/Beaglebone-CAN-Cape.git`

 Be sure you have disabled the HDMI in /boot/uEnv.txt by uncommenting:

`dtb=am335x-boneblack-emmc-overlay.dtb`

If you have not previously done the above, you will need to reboot after uncommenting the line.

Next, run the installation script included in the repo. The installation script installs the linux package `can-utils` on the beaglebone. This package has the software necessary to make sense of the messages on the bus and provides a display interface:

`beagle$ cd Beaglebone-CAN-cape/`
`beagle$ ./install.sh`

Then, be sure you are operating as root, and then source the setup script. This will configure the pin muxes for dcan1, which operates on P9_24 and P9_26. It also uses P8_13 to control the CAN transceiver STANDBY pin. Then it sets up the interface can1. You must provide the bitrate of the CAN bus as an argument, replacing `BITRATE` in the command below. If you are developing your own network, you should know this value as you should have selected it. If you are attempting to sniff a production vehicle, your best bet is to start with 500000, which is representative of 500 kbps. If this doesn`t work, try a google search to see if you can find the bitrate:

`beagle$ source setup.sh BITRATE`

After the above steps complete successfully, the can1 interface should be up and running. You can confirm this by running:

`beagle$ ifconfig`

You should see an interface `can1` and, if you have connected to a bus and have entered the correct bitrate, you should see an RX count above 0.

If you have a can1 interface up and running, you now have a couple of can-utils you can use to view the messages. The first is:

`beagle$ candump can1`

This will dump all of the received CAN messages to the terminal.

If you want a more organized view, then cansniffer is your best bet. Run:

`beagle$ cansniffer can1 -c`

The cansniffer utility will display the messages received in the terminal as well, but it isn`t a scrolling list. When a message is received, and a previous message with that ID has already been received, the new data overwrites the old data. Further, the -c flag causes any differences in the data received from one message to the next to be highlighted in red.

* If there is extra hardware needed, include links to where it can be obtained. 
