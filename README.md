# UEFI OVMF debug on QEMU

Build OVMF and start in QEMU with gdb debug

## Setup
```
git submodule add https://github.com/tianocore/edk2.git edk2
git add edk2
```

## Build
Using docker image at  ajiyengar/docker-edk2
```
docker run -it -v /mnt/data/dockerhome:/home -v .:/work -e EDK2_DOCKER_USER_HOME=/home -w /work edk2-ubuntu-22-dev-aj /bin/bash build_ovmf_x64.sh
```

## Run
Execute `run.sh` to launch QEMU

