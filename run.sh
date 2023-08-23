#!/usr/bin/env bash

touch $PWD/debugcon.log
setsid ${TERMINAL} -e tail -f $PWD/debugcon.log &
setsid ${TERMINAL} -e gdb -ex "target remote localhost:1234" &
qemu-system-x86_64 -M q35 -smp 4 -m 4G --accel kvm -drive file=fat:rw:VirtualDrive,format=raw,media=disk -drive if=pflash,format=raw,file=Build/OvmfX64/DEBUG_GCC5/FV/OVMF.fd -serial mon:stdio -debugcon file:debugcon.log -global isa-debugcon.iobase=0x402 -net none -display none -s -S
# --accel tcg,thread=single
