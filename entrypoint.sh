#!/bin/sh

sh -c '/usr/bin/rclone rcd --rc-web-gui --rc-user rclone --rc-pass gui --rc-addr :5572 --rc-web-gui-no-open-browser &'

exec /usr/sbin/rpcbind -f -w

# fail-safe
exec /usr/bin/sleep infinity
