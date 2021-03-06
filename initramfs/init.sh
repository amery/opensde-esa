#!/bin/sh
# --- SDE-COPYRIGHT-NOTE-BEGIN ---
# This copyright note is auto-generated by ./scripts/Create-CopyPatch.
#
# Filename: target/esa/initramfs/init.sh
# Copyright (C) 2012 The OpenSDE Project
#
# More information can be found in the files COPYING and README.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; version 2 of the License. A copy of the
# GNU General Public License can be found in the file COPYING.
# --- SDE-COPYRIGHT-NOTE-END ---

init=/sbin/init

# sysinit
#
mount -t proc none /proc
mount -t devtmpfs none /dev

exec > /dev/console < /dev/console 2>&1

if /sbin/init.d/trymount && [ -x "/rootfs$init" ]; then
	for x in proc dev; do
		mount --move /$x /rootfs/$x
	done
	exec switch_root /rootfs "$init" "$@"
fi
exec setsid /bin/sh
