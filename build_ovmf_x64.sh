#!/usr/bin/env bash

set -e

###############
# Build UEFI
###############
make -C edk2/BaseTools

export ARCH=X64
export COMPILER=GCC5
export WORKSPACE=$PWD
export PACKAGES_PATH=$WORKSPACE/edk2
export BUILD_FLAGS="-D SECURE_BOOT_ENABLE=1 -D TPM2_ENABLE=1 -D NETWORK_TLS_ENABLE=1 -D NETWORK_IP6_ENABLE=1 -D NETWORK_HTTP_BOOT_ENABLE=1 -D INCLUDE_TFTP_COMMAND=1 -D SOURCE_DEBUG_ENABLE=TRUE"
#-D DEBUG_ON_SERIAL_PORT=TRUE"

source edk2/edksetup.sh

build -a ${ARCH} -t ${COMPILER} -b DEBUG -p edk2/OvmfPkg/OvmfPkgX64.dsc --pcd gEfiMdeModulePkgTokenSpaceGuid.PcdFirmwareVendor=L"Ajay Custom Qemu x64" --pcd gEfiMdeModulePkgTokenSpaceGuid.PcdFirmwareVersionString=L"Ajay Custom Qemu x64" ${BUILD_FLAGS}
