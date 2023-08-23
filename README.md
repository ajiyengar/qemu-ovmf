# UEFI OVMF debug on QEMU

Build OVMF and start in QEMU with gdb debug

## Setup
```
git submodule update --init --recursive
```

## Build
Using docker image at  ajiyengar/docker-edk2
```
docker run -it -v /mnt/data/dockerhome:/home -v .:/work -e EDK2_DOCKER_USER_HOME=/home -w /work edk2-ubuntu-22-dev-aj /bin/bash build_ovmf_x64.sh
```

## Run
Execute `run.sh` to launch QEMU
Get text/data section address from Build/.../OVMF.map
Then to debug SEC, in GDB:
```
add-symbol-file Build/OvmfX64/DEBUG_GCC5/X64/SecMain.debug 0xfffcc2d4 -s .data 0xfffdc9d4
set substitute-path /work .
```


---

#### One-time Setup
Add edk2 submodule:
```
git submodule add https://github.com/tianocore/edk2.git edk2
git add edk2
```

Create a drive accessible to UEFI:
```
mkdir VirtualDrive
```

