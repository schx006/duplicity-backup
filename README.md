# Secure encrypted backup of a VPS[^1] on a S3 Object Storage server using _Duplicity_

Duplicity backup script-shell   
Version: 1.1   
Author:  Xavier Schoepfer   
license: GNU General Public License v3.0

## Docs

* Duplicity(1) man page
* [_Duplicity_ on Debian Wiki](https://wiki.debian.org/Duplicity)
* gpg(1) man page

## HowTo (install)

If needed, create `/root/bin` directory with `drwx------` permissions.   
Load `backup.sh` and `duplicity.conf` files on VPS.
As 'root', run the commands[^2] below:   
``` sh
apt-get update
apt-get upgrade
aptget install python-pip gpg duplicity git

# Module used by duplicity for S3 Object Storage connexion
pip install boto


git clone https://github.com/schx006/duplicity-backup/ /path/to/GitHubDirectory/duplicity-backup
```

Edit `duplicity.conf` with _ad-hoc_ parameters…
* S3 server name
* S3 bucket name
* IAM access key Id.
* IAM secret key
* GnuPG key signature or fingerprint (to identify wich to use)
* GnuPG key passphrase (in clear text; if not present, the passphrase will be prompted, needed to schedule backup task)
* set the list of directories to backup as required (Warning: do not try to backup `/proc` directory! Backup will crash.
If needed, add the `--exclude /proc` argument in the duplicity command line…)

``` sh
cp /path/to/GitHubDirectory/duplicity-backup/backup.sh /root/bin/
chmod 700 /root/bin/backup.sh

cp /path/to/GitHubDirectory/duplicity-backup/duplicity.conf /root/.config/
chmod 600 /root/.config/duplicity.conf

gpg --gen-key

``` 

Run the bachup task:
``` sh
/root/bin/backup.sh
```

When everything is OK, you can schedule the `/root/bin/backup.sh` command with `crontab -e`.
_ie._ to backup the VPS every monday at 1:00 am, add the line:
``` sh
0 1 * * 1     /root/bin/backup.sh
```

## Comments

In this configuration, the script run only "full backup". Incremental backup is not used.   
Then, the backup is not verified. It will coming soon with next releases…

**DON'T FORGET** to backup GnuPG keys and the other backup parameters in a independant way to be able to restore the backup datas.

For instance, using an USB storage device:   
1. On the VPS,   
    ``` sh
    tar -czvf /root-$HOSTNAME.tgz --exclude='.bash_history' --exclude='.cache' /root
    ```
2. On the local computer,   
    ``` sh
    scp -P sshPort user@vpsName.domainName.tld:/root-vpsName.tgz /path/to/USB/StorageDevice
    ```
3. Keep the USB storage device in a secure place. You can remove the `/root-vpsName.tgz` files on VPS.


[^1]: VPS or other Linux computer. _Duplicity_ can also run on MacOS computer.   
[^2]: Users must modify the install command if they are using an OS distribution other than Debian Linux family.   
