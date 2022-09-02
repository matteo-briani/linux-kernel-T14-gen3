#!/bin/bash

cd /builder/linux
git checkout dcf8e5633e2e69ad60b730ab5905608b756a032f
mv /builder/ubuntu-based-general-kernel-config .config
# git am ../remove-return.patch
git am ../i915.patch
make olddefconfig
make clean
make -j `getconf _NPROCESSORS_ONLN` bindeb-pkg LOCALVERSION=-t14gen3-custom
cd ..
mv *deb /builds
