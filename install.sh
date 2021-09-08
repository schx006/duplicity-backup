#!/usr/bin/env bash

# Installation tool for Duplicity backup

# Duplicity backup script-shell
# Version 2.0.0
# File:    /path/to/GitHubRepository/install.sh
# Author:  Xavier Schoepfer
# license: GNU General Public License v3.0



# Install files:
#			/root/bin/backup.sh
#			/root/.duplicity/duplicity.conf
#			/root/.duplicity/backup-auth.conf
#			/root/.duplicity/backup-dirlist.conf


files='duplicity.conf backup-auth.conf backup-dirlist.conf backup.sh'

umask 077



# copy the file to its destination if it is not already there,
# otherwise do nothing.
function simple-file-copy {
	if [ -f $dest ] ; then
		echo "WARNING: \"$dest\" file already exixts!"
		echo "Installation of the \"$dest\" file skipped…"
	else
		echo -n "Copying file: "
		cp -v $f $dest
	fi
}


# copy the file to its destination if it is not already there, otherwise
# rename the existing file with the suffix '.old' before copying it.
function secure-file-copy {
	if [ -f $dest ] ; then
		echo "WARNING: \"$dest\" file already exixts!"
		echo -n "Moving file: "
		mv -v $dest '$dest.old'
	fi
	echo -n "Copying file: "
	cp -v $f $dest
}



# you MUST be root, ti install the Duplicity backup script.
if [ $UID -ne 0 ] ; then
	echo "WARNING: You have to be \"root\", or use \"sudo\", to run this script!"
	exit 1
fi

# if the needed directories don't exit… create them.
if [ ! -d /root/bin ] ; then
	mkdir -v /root/bin
fi
if [ ! -d /root/.duplicity ] ; then
	mkdir -v /root/.duplicity
fi



# files installation
for f in $files ; do
	case $f in
		duplicity.conf)
			dest="/root/.duplicity/$f"
			secure-file-copy
			;;
		backup-auth.conf)
		backup-dirlist.conf)
			dest="/root/.duplicity/$f"
			simple-file-copy
			;;
		backup.sh)
			dest="/root/bin/$f"
			secute-file-copy
			if [ ! -x $dest ] ; then
				echo "Setting up authorisations: "
				chmod -v 700 $dest
			fi
			;;
	esac
done
