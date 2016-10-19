#!/bin/bash
. /opt/farm/scripts/init
. /opt/farm/scripts/functions.custom


src=/opt/farm/ext/log-rotate/profiles/$OSVER

if [ "$OSTYPE" = "netbsd" ]; then
	dst=/usr/pkg/etc/logrotate.d/
else
	dst=/etc/logrotate.d
fi

if [ -d $dst ] && [ -d $src ]; then
	echo "setting up logrotate configuration"
	for f in `ls $src`; do
		ln -sf $src/$f $dst/$f
	done
fi
