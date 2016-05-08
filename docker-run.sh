#!/bin/bash

set -e

mkdir -p /root/.ssh
chmod 750 /root/.ssh

if [ -n "${AUTHORIZED_KEY}" ]; then
	[ -f /root/.ssh/authorized_keys ] || cat <<EOF > /root/.ssh/authorized_keys
${AUTHORIZED_KEY}
EOF

fi

chmod 640 /root/.ssh/authorized_keys

printf "Start SSH server"
exec /usr/sbin/sshd -D 
