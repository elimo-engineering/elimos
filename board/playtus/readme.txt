Intro
=====

This directory contains a buildroot configuration for building an image for
the Elimo Impetus SoM - Playtus edition (i.e. on top of the Initium breakout
board, to play little games on an lcd, with sound and Logitec gamepad support)

How to build it
===============

Configure Buildroot
-------------------

  $ make elimo_playtus_defconfig

Build the rootfs
----------------

Note: you will need to have access to the network, since Buildroot will
download the packages' sources.

You may now build your rootfs with:

  $ make

(This may take a while, consider getting yourself a coffee ;-) )

Result of the build
-------------------

After building, you should obtain this tree:

output/images
├── boot.scr
├── boot.vfat
├── rootfs.ext2
├── rootfs.ext4 -> rootfs.ext2
├── rootfs.squashfs
├── rootfs.tar
├── sdcard.img
├── sun8i-s3-elimo-initium.dtb
├── u-boot.bin
├── u-boot-sunxi-with-spl.bin
└── zImage

How to write the SD card
========================

Once the build process is finished you will have an image called
"sdcard.img" in the output/images/ directory.

Copy the bootable "sdcard.img" onto an SD card with "dd":

  $ sudo dd if=output/images/sdcard.img of=/dev/sdX

Alternatively, you can use the Etcher graphical tool to burn the image
to the SD card safely and on any platform:

https://etcher.io/

Once the SD card is burned, insert it into your Impetus module,
and power it up. Your new system should come up now and start a
console on the UART0 serial port and another on the LCD screen
