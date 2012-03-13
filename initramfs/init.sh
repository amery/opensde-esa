#!/bin/sh

# sysinit
#
mount -t proc none /proc
mount -t devtmpfs none /dev

exec > /dev/console < /dev/console 2>&1

exec setsid /bin/sh
