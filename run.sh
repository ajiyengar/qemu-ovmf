#!/usr/bin/env bash

qemu-system-x86_64 -M q35 -smp 4 -m 4G --accel kvm -drive file=fat:rw:VirtualDrive,format=raw,media=disk -drive if=pflash,format=raw,file=Build/OvmfX64/DEBUG_GCC5/FV/OVMF.fd -debugcon file:debugcon.log -global isa-debugcon.iobase=0x402 -net none
# -display none
# --accel tcg,thread=single
