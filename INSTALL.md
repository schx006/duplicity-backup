# Installation HowTo

### Preparing your machine

As "root", run the commands¹ below:   
``` sh
apt-get update
apt-get upgrade
apt-get install git python-pip gpg duplicity

# Module used by duplicity for S3 Object Storage connexion
pip install boto

```

Generate a pair of GnuPG keys to encrypt and sign the backups:
``` sh
gpg --gen-key
[...]
```

Load the script and configuration files on the VPS:
``` sh
git clone https://github.com/schx006/duplicity-backup/ /path/to/GitHubDirectory/duplicity-backup
cd /path/to/GitHubDirectory/duplicity-backup

```

## Installation

### By hand istallation

If needed, create `/root/bin` and `/root/.duplicity` directories with `drwx------` (0700) permissions.   
Then:
``` sh
cp backup.sh /root/bin/
chmod 700 /root/bin/backup.sh
cp duplicity.conf /root/.duplicity/
cp backup-*.conf  /root/.duplicity/   # DON'T owerwrite these files
chmod 600 /root/.duplicity/*.conf

``` 
Warning: DO NOT overwrite the `backup-auth.conf` or `backup-dirlist.conf` files
if they are already configured in the `/root/.duplicity/` directory!

### Alternative: installation by script 

Useful if you install these backup scripts on many computers… 🙂

``` sh
./install.sh
```
The script creates directories (if needed), it copies the required files and sets permissions.


## Configuration

### Initial setup

Edit `/root/.duplicity.conf` with _ad-hoc_ parameters…
* S3 server name
* S3 bucket name
* IAM access key Id.
* IAM secret key
* GnuPG key signature or fingerprint (to identify wich to use)
* GnuPG key passphrase (in clear text; if not present, the passphrase will be prompted, needed to schedule backup task)
* set the list of directories to backup as required (Warning: do not try to backup `/proc` directory! Backup will crash.
If needed, add the `--exclude /proc` argument in the duplicity command line…)

### Extraction from existing _.duplicity.conf_ file

...

### By the end…

Run the bachup task:
``` sh
/root/bin/backup.sh
```

## Operating

When everything is OK, you can schedule the `/root/bin/backup.sh` command with `crontab -e`.
_ie._ to backup the VPS every monday at 1:00 am, add the line:
``` sh
0 1 * * 1     /root/bin/backup.sh
```

---

**DO NOT FORGET** to backup GnuPG keys and the other backup parameters in a independant way
to be able to restore the backup datas.

For instance, using an USB storage device:   
on the VPS,   
``` sh
tar -czvf /root-$HOSTNAME.tgz --exclude='.bash_history' --exclude='.cache' /root
```
… on the local computer,   
``` sh
scp -P sshPort user@vpsName.domainName.tld:/root-vpsName.tgz /path/to/USB/StorageDevice
```
… then, keep the USB storage device in a secure place. Remove the `/root-*.tgz` file on VPS.


---

¹ Users must modify the install command if they are using an OS distribution other than Debian Linux family.   
