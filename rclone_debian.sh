#!/bin/bash

apt-get install -y nload htop fuse p7zip-full

KernelBit="$(getconf LONG_BIT)"
[[ "$KernelBit" == '32' ]] && KernelBitVer='i386'
[[ "$KernelBit" == '64' ]] && KernelBitVer='amd64'
[[ -z "$KernelBitVer" ]] && exit 1
cd /tmp
wget -N --no-check-certificate -O '/tmp/rclone.zip' "https://downloads.rclone.org/rclone-current-linux-$KernelBitVer.zip"
7z x /tmp/rclone.zip
cd rclone-*
cp -raf rclone /usr/bin/
chown root:root /usr/bin/rclone
chmod 755 /usr/bin/rclone
mkdir -p /usr/local/share/man/man1
cp -raf rclone.1 /usr/local/share/man/man1/
mandb
