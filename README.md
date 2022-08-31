# linux kernel for the Lenovo T14 gen3
A patched linux kernel for the Lenovo T14 gen3.
The kernel config is copied from the general ubuntu kernel 5.19.3.

## Suspend issue
The problem is discussed [here](https://gitlab.freedesktop.org/drm/intel/-/issues/5531).

The patch is proposed by ```taoky``` in the above thread.

This repo only simplifies things in case I to do a fresh install on my Lenovo T14 gen3 with the patched kernel.

ELAN Touchpad also suffers from a bizzare behaviour after S3 suspend.
The only (quick) solution I found is to change the BIOS settings to "windows/linux" sleep mode.

## Commands

A container is provided to keep your system clean (otherwise, take a look at ```launch.sh```).
```
docker build -t kernel-builder .
docker run --mount type=bind,source="$(pwd)"/builds,target=/builds -it kernel-builder /builder/launch.sh
```
Then install the compiled kernel
```
cd builds
sudo dpkg -i *deb
```
