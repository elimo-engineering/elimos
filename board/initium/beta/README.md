Intro
=====

This directory contains a buildroot configuration and data for building an image for
the Elimo Initium EVK beta version.
The base/ sibling of this directory is used as a starting point, and the defconfig points
to Beta-specific files in this directory (essentially just boot-related config to have the
console on UART1 instead of UART0)

How to build it
===============

Configure Buildroot
-------------------

  $ make -C buildroot elimo_betaimpetus_defconfig

Build the rootfs
----------------

Note: you will need to have access to the network, since Buildroot will
download the packages' sources.

You may now build your rootfs with:

  $ make -C buildroot

(This may take a while, consider getting yourself a coffee ;-) )

Result of the build
-------------------

After building, you should obtain this tree:

    buildroot/output/images/
    +-- boot.scr
    +-- boot.vfat
    +-- brcm/
    +-- rootfs.ext2
    +-- rootfs.ext4 -> rootfs.ext2
    +-- rootfs.tar
    +-- sdcard.img
    +-- sun8i-s3-elimo-initium.dtb
    +-- u-boot.bin
    +-- u-boot-sunxi-with-spl.bin
    `-- zImage

How to write the SD card
========================

Once the build process is finished you will have an image called
"sdcard.img" in the buildroot/output/images/ directory.

Copy the bootable "sdcard.img" onto an SD card with "dd":

  $ sudo dd if=buildroot/output/images/sdcard.img of=/dev/sdX

Alternatively, you can use the Etcher graphical tool to burn the image
to the SD card safely and on any platform:

https://etcher.io/

Once the SD card is burned, insert it into your Impetus module,
and power it up. Your new system should come up now and start a
console on the UART1 serial port.
