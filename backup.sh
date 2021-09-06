#!/usr/bin/env bash

# Duplicity backup script-shell
# Version 1.1
# "Full backup" only
# File:    /root/bin/backup.sh
# Author:  schx006@xs-net.io
# license: GNU General Public License v3.0

# Edit '/root/.duplicity.conf' file to configure

# uncomment for debug
#set -x



. /root/.duplicity.conf
#. /root/.duplicity/backup.conf
#. /root/.duplicity/duplicity.conf



# loop on directories
echo -n "---- Starting the \"Full backup\" of $HOSTNAME ---- "; date
for i in $DIRS2BACKUP ; do
	echo -e "\n==>   Backup of directory $i"
	$DUP_EXEC $i $TARGET_URL$i
#	$DUP_VERIF $TARGET_URL$i $i
	$DUP_CLEANUP $TARGET_URL$i
done
echo -n "---- \"Full backup\" of $HOSTNAME complete ---- "; date
