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

A container is provided is case you want to keep your system clean. 
```
docker build -t kernel-builder .
docker run --mount type=bind,source="$(pwd)"/builds,target=/builds -it kernel-builder /bin/bash
```
Then, inside the container
```
cd /builder/linux
git checkout dcf8e5633e2e69ad60b730ab5905608b756a032f
make mrproper
mv ubuntu-based-general-kernel-config .config
git am 0001-Patch-i915.patch
make olddefconfig
make clean
make -j `getconf _NPROCESSORS_ONLN` 
make deb-pkg LOCALVERSION=-T14gen3-custom
cd ..
chmod 666 *deb
mv *deb /builds
exit
```
Then, outside the container, install the compiled kernel
```
cd builds
sudo dpkg -i *deb
```
