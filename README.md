# Secure encrypted backup of a VPS¹ on a S3 Object Storage server using _Duplicity_

Duplicity backup script-shell   
Version: 2.0.0   
Author:  Xavier Schoepfer   
license: GNU General Public License v3.0

## Docs

* Duplicity(1) man page
* [_Duplicity_ on Debian Wiki](https://wiki.debian.org/Duplicity)
* gpg(1) man page

## Installation

See instructions in the file [INSTALL.md](https://github.com/schx006/duplicity-backup/blob/testing/INSTALL.md).

## Operating

### Manual backup
Run the script in a SSH cession:
``` sh
/root/bin/backup.sh
```

### Sheduled backup
With the command `crontab -e`, add the line below to schedule the backup every Monday at 01:00 am
and generate a date-stamped report in the `/tmp/` directory:
``` sh
0 1 * * 1     /root/bin/backup.sh > /tmp/backup-report-`date +%y%m%d`.txt 2>&1
```

## Notes

### Introduction to the project
I was writing this script schell to automatically backup a VPS (with Debian Linux OS)
hosted by [OVH](https://ovh.com).
I already used Duplicity a few years ago,
to backup a linux computer to an other computer (on the same LAN)
or external hard disks.    
The challenge now is to back up a VPS to another cloud solution.    
The constraint is to use reliable and economical tools.    
My choice is the S3 Object Storage service from the Swiss company
[Exoscale](https://www.exoscale.com).

### Strategic options

[to be continued] 

### Deployment

Besides the VPS, I use my script to backup several [Raspberry Pi](https://www.raspberrypi.org).

---

¹ VPS or other Linux computer. _Duplicity_ can also run on MacOS computer.   
