#!/usr/bin/env bash


# Tool for Duplicity backup
# Version 1.0
# File:    /path/to/GitHubRepository/tools/install.sh
# Author:  schx006@xs-net.io
# license: GNU General Public License v3.0

# Install files:
#			/root/bin/backup.sh
#			/root/.duplicity.conf


files='duplicity.conf backup.sh'

umask 077

function copy-file {
	if [ -f $dest ] ; then
		echo "WARNING: \"$dest\" file already exixts!"
		echo "Installation aborted…"
		exit 1
	else
		echo -n "Copying file: "
		cp -v $f $dest
	fi
}



if [ $UID -ne 0 ] ; then
	echo "WARNING: You have to be \"root\", or use \"sudo\", to run this script!"
	exit 1
fi

for f in $files ; do
	case $f in
		duplicity.conf)
			dest="/root/.$f"
			copy-file
			;;
		backup.sh)
			dest="/root/bin/$f"
			copy-file
			if [ ! -x $dest ] ; then
				echo "Setting up authorisations: "
				chmod -v 700 $dest
			fi
			;;
	esac
done
