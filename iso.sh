#!/bin/sh
set -e
. ./build.sh

mkdir -p isodir
mkdir -p isodir/boot
mkdir -p isodir/boot/grub

cp sysroot/boot/shitOS.kernel isodir/boot/shitOS.kernel
cat > isodir/boot/grub/grub.cfg << EOF
menuentry "shitOS" {
	multiboot /boot/shitOS.kernel
}
EOF
grub-mkrescue -o shitOS.iso isodir
