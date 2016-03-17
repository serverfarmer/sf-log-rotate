#!/bin/bash
. /opt/farm/scripts/init
. /opt/farm/scripts/functions.custom


path=/opt/farm/ext/log-rotate/profiles/$OSVER

if [ -d /etc/logrotate.d ] && [ -d $path ]; then
	echo "setting up logrotate configuration"
	for f in `ls $path`; do
		ln -sf $path/$f /etc/logrotate.d/$f
	done
fi
