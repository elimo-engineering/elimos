# ElimOS Buildroot external tree for Impetus SoM and Initium EVK

This repository is a Buildroot `BR2_EXTERNAL` tree dedicated to
supporting the [Elimo Engineering](https://elimo.io)
[Impetus SoM and Initium EVK](https://elimo.io/portfolio/impetus/)
platforms.

## Available configurations

This `BR2_EXTERNAL` tree provides 3 example Buildroot
configurations:

1. `elimo_initium_defconfig`, which is a minimal configuration to
   support the [Initium EVK](https://elimo.io/portfolio/impetus)
   board based on the Impetus SoM. It builds the U-Boot bootloader, Linux kernel
   and a minimal user-space composed of just Busybox and a few utilities.

2. `elimo_playtus_defconfig`, which is a configuration to build the Initium demo as
   shown in our stands at [various industry events](https://www.electromaker.io/blog/article/hardware-pioneers-2022-elimos-impetus-is-a-highly-connected-module)
   It builds the U-Boot bootloader, Linux kernel, and a richer user-space
   that includes OpenTyrian and prboom (a Doom emulator).

3. `elimo_beechat_defconfig`, support for the custom carrier board for the [Beechat](https://beechat.network/) portable mesh hotspot


## Getting started

### Pre-requisites

In order to use [Buildroot](https://www.buildroot.org), you need to
have a Linux distribution installed on your workstation. Any
reasonably recent Linux distribution (Ubuntu, Debian, Fedora, Redhat,
OpenSuse, etc.) will work fine.

Then, you need to install a small set of packages, as described in the
[Buildroot manual System requirements
section](https://buildroot.org/downloads/manual/manual.html#requirement).

For Debian/Ubuntu distributions, the following command allows to
install the necessary packages:

```bash
$ sudo apt install debianutils sed make binutils build-essential gcc g++ bash patch gzip bzip2 perl tar cpio unzip rsync file bc git gcc-multilib g++-multilib python3-dev libssl-dev
```

There are also optional dependencies if you want to use Buildroot features
like interface configuration, legal information or documentation.
Please see the [corresponding manual section](https://buildroot.org/downloads/manual/manual.html#requirement-optional).

### Getting the code

This tree brings in the required version of buildroot as a submodule, so you do not need
to clone buildroot separately.

Now, clone the matching branch of the `BR2_EXTERNAL` tree:

```bash
$ git clone --recurse-submodules git@github.com:elimo-engineering/elimos.git
```

or, if you want to use the https protocol:

```bash
$ git clone --recurse-submodules https://github.com/elimo-engineering/elimos.git
```

### Configure and build

From the root of the repo, configure the system you want to build by using one of the 3
*defconfigs* provided in this `BR2_EXTERNAL` tree. For example:

```bash
$ make -C buildroot BR2_EXTERNAL=.. elimo_initium_defconfig
```

We are passing two informations to `make`:

1. The path to `BR2_EXTERNAL` tree, relative to the buildroot submodule directory. This is only needed once per repo, as the value of `BR2_EXTERNAL` is stored on disk.

2. The name of the Buildroot configuration we want to build.

If you want to further customize the Buildroot configuration, you can
now run `make menuconfig` or `make nconfig`, but for your first build, we recommend you
to keep the configuration unchanged so that you can verify that
everything is working for you.

Start the build:

```bash
$ make -C buildroot
```

This will automaticaly download and build the entire Linux system for
your Impetus platform: cross-compilation toolchain, firmware,
bootloader, Linux kernel, root filesystem. It might take between 30
and 60 minutes depending on the configuration you have chosen and how
powerful your machine is.

## Flashing and booting the system

The Buildroot configurations generate a ready-to-use SD card image,
available as `buildroot/output/images/sdcard.img`. Flash this image on a SD card:

```bash
$ dd if=buildroot/output/images/sdcard.img of=/dev/sdX bs=1M
```

(Note: this assumes your SD card appears as `/dev/sdX` on your system.)

Then (assuming you are using the Initium, custom carrier boards will vary):

1. Switch the `POWER SW` switch to `OFF`

2. Insert the microSD card on the Impetus SoM

3. Configure the `UART SELECT` switch to `0`

4. Plug a USB-C cable in the USB-C connector of the Initium and run your serial communication program on /dev/ttyUSB0.

5. Switch the `POWER SW` switch to `ON`.

6. The system will start, with the console on UART. You can log-in as
`root` with no password. If you have an LCD, you can plug in a keyboad on a
USB-A connector and log in on the LCD

# Going further

* [Testing display support](docs/display.md)
* [Using WiFi](docs/wifi.md)
* [Using Bluetooth](docs/bluetooth.md)
* [Using Audio](docs/audio.md)
* [Using Camera](docs/camera.md)
* [Using Qt5 demos](docs/qt5.md)
* [Using OP-TEE](docs/optee.md)

# References

* [Buildroot](https://buildroot.org/)
* [Buildroot reference manual](https://buildroot.org/downloads/manual/manual.html)
* [Buildroot system development training
  course](https://bootlin.com/training/buildroot/), with freely
  available training materials

# Support

You can contact Elimo at info@elimo.io for commercial support on
using Buildroot on Impetus SoM platforms.
