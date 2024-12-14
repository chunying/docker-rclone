#!/bin/sh

_USER="${RC_USER:-rclone}"
_PASS="${RC_PASS:-gui}"

sh -c "/usr/bin/rclone rcd --rc-web-gui --rc-user '$_USER' --rc-pass '$_PASS' --rc-addr :5572 --rc-web-gui-no-open-browser &"

exec /usr/sbin/rpcbind -f -w

# fail-safe
exec /usr/bin/sleep infinity
