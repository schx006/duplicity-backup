# Secure encrypted backup of a VPS¹ on a S3 Object Storage server using _Duplicity_

Duplicity backup script-shell   
Version: 2.0.0   
Author:  [S.X.](schx006@xs-net.io)   
license: GNU General Public License v3.0

## Docs

* Duplicity(1) man page
* [Duplicity_ on Debian Wiki](https://wiki.debian.org/Duplicity)
* gpg(1) man page

## Operating

### Manually backup
Run the script in a SSH cession:
``` sh
/root/bin/backup.sh
```

### Sheduled backup
With the command `crontab -e`, add the line below to schedule the backup every Monday at 01:00 am
and generate a time-stamped report in the `/tmp/` directory:
``` sh
0 1 * * 1     /root/bin/backup.sh > /tmp/backup-report-`date +%y%m%d`.txt
```

## Notes

---

¹ VPS or other Linux computer. _Duplicity_ can also run on MacOS computer.   
