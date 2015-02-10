renga build is a custom version of buildroot for raspberry pi. 

To build, do

    # make renga_defconfig
    # make

To create a sd, do ( after build completed ),

   # ./board/renga/sdcard.sh

The image is sdcard.img.
