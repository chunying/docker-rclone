# docker-rclone

My simplest rclone docker for remote file synchronization.

# quick start guide

- Clone this repo
- Create your own `rclone.conf` by following the guide from [rclone](https://rclone.org/docs/#configure)
    - You may also want to read [remote setup](https://rclone.org/remote_setup/) and [rclone authorize](https://rclone.org/commands/rclone_authorize/) if you are working on a remote (headless) machine
- (Optional) modify the default user name (`RC_USER`) and password (`RC_PASS`) in `docker-compose.yml`
    - The default username/password to access the GUI is `rclone/gui`
- Choose the directory you want to synchronize
    - Add each directory as a volume to the `docker-compose.yml`
    - The sample configuration maps a local `/volume1/vol1/photos` to `/mnt/photos`; remove it in your setup
- You can access the (experimental) web GUI via the link
    - `http://rclone:gui@<serveraddr>:5572/?login_token=cmNsb25lOmd1aQ%3D%3D`
    - Replace the `<serveraddr>` with your server's IP address.
    - If you have modified the default username and password, use `docker logs` to inspect the access URL.

# some useful commands

- Sync files to the remove:
   - Command:
     `rclone sync -n SRC:path DEST:path --progress --exclude-from /excluded.txt`
   - The `-n` option enables the dry-run mode; remove it to perform the sync operation
   - Files in the DEST:path ***WILL BE REMOVED*** if they were not available in SRC:path, used it with care!
   - User `--interactive (-i)`or `--dry-run (-n)` for safety
   - If you want to keep files in DEST:path, use `rclone copy` instead of `clone sync`
   - If your source is a directory, ensure that you also have that name on your destination

- Copy files to the remote
   - Command:
     `rclone copy -n SRC:path DEST:path --progress --exclude-from /excluded.txt`
   - The `-n` option enables the dry-run mode; remove it to perform the copy operation
   - Identical files will be skipped

# Sample commands to mount a remote CIFS filesystem

  `mount.cifs "//$CIFS_SERVERIP/path/to/shared/folder" /mnt -o user=$CIFS_USER,pass=$CIFS_PASS,iocharset=utf8`

# Sample commands to mount a remote NFS filesystem

  `mount -t nfs $NFS_SERVERIP/path/to/exported/folder /mnt`

