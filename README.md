
psc-tools
=========

This repo holds a set of scripts and systemd service files for setting up
"programspace" containers: http://freedomboxblog.nl/program-space

'psc' is a very lightweight utility making use of kernel namespaces.

The containers are expected to consist of a chroot environment set-up in a
specific way, which will be mounted as an overlayfs filesystem and used
as the programspace rootfs.

The programspace's files should follow the below directory structure:

```
PSC_DIR must have a specific structure:

PSC_DIR
|-lower
|  |-[lower_dir_0]
|  |  |- lower_files
|  |  '- ...
|  | ...
|  '-[lower_dir_n]
|  |  |- lower_files
|     '- ...
|-upper
|  |-data
|  |  |- upper_files
|  |  '- ...
|  '-work
'-rootfs
```

Allo directories under the PSC_DIR/lower directory will be used as overlayfs
lowerdirs, and the upper/data directory will be used as the overlayfs upperdir.
The overlayfs will be mounted on rootfs, and psc --chrootfs'd into by
setup-psc.

When start-psc is run, "/usr/bin/init start" will be run inside the
programspace, which should start whatever services are required.

stop-psc will run /usr/bin/init stop, and teardown-psc will clean up the
programspace and its mounts.
