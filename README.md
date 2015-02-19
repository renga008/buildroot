renga build is a custom version of buildroot for raspberry pi. 

To build, do

    # mkdir /opt/renga; chown self /opt/renga
    # make renga_defconfig
    # make

To create a sd, do ( after build completed ),

   # ./board/renga/sdcard.sh

The image is sdcard.img.



WiFi
====
This version of buildroot supports a single wifi. You need to customize wifi
for your own network and probalby not check in since this contains access
information. WiFi configuration is done in two files:

	1. board/renga/skeleton/etc/network/interfaces 
	   change the essid for your network
	2. board/renga/skeleton/etc/wpa_supplicant.conf
	   change the essid and the passphrase. wpa_passphrase is useful.
