#!/bin/sh
. /opt/farm/scripts/init
. /opt/farm/scripts/functions.install


base=/opt/farm/ext/log-rotate/profiles/$OSVER

if [ "$OSTYPE" = "freebsd" ]; then
	target=/usr/local/etc/logrotate.d
elif [ "$OSTYPE" = "netbsd" ]; then
	target=/usr/pkg/etc/logrotate.d
elif [ "$OSTYPE" = "qnap" ]; then
	target=/opt/etc/logrotate.d
else
	target=/etc/logrotate.d
fi

if [ -d $target ] && [ -d $base ]; then
	echo "setting up logrotate configuration"
	for f in `ls $base`; do
		remove_link $target/$f
		install_copy $base/$f $target
	done
fi
