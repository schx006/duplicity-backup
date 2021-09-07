#!/usr/bin/env bash

# Duplicity backup script-shell
# Version 2.0.0
# "Full backup" only
# File:    /root/bin/backup.sh
# Author:  Xavier Schoepfer
# license: GNU General Public License v3.0

# Edit '/root/.duplicity/backup-auth.conf' file
#	to set up S3 Authentification & GnuPG configuration
# Edit '/root/.duplicity/backup-dirlist.conf' file
#	to set up the list of directories to backup


# uncomment for debug
#set -x



#. /root/.duplicity/backup-auth.conf
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
