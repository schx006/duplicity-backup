#!/usr/bin/env bash

# Duplicity backup script-shell
# Version 1.0
# "Full backup" only
# File:    /root/bin/backup.sh
# Author:  schx006@xs-net.io
# license: GNU General Public License v3.0

# Edit '/root/.duplicity.conf' file to configure

# uncomment for debug
#set -x



. /root/.duplicity.conf



# loop on directories
echo -n "---- Starting the \"Full backup\" of $HOSTNAME ---- "; date
for i in $BACKDIRS ; do
    echo -e "\n==>   Backup of directory $i"
    $DUP_EXEC $DUP_PARAM $i $TARGET_URL$i
    $DUP_CLEANUP $TARGET_URL$i
done
echo -n "---- \"Full backup\" of $HOSTNAME complete ---- "; date
