# busybox

> **Notice:** *This image will probably soon be deprecated in favor of our even smaller [Alpine Linux based image](https://github.com/gliderlabs/docker-alpine). Alpine is a minimal Linux distro designed with containers in mind, based on Busybox, with a real, modern package system*

This might not be the smallest Busybox container (4.8MB), but it has [opkg](http://wiki.openwrt.org/doc/techref/opkg), which means you can *very easily* install other [common packages](http://downloads.openwrt.org/snapshots/trunk/x86_64/generic/packages/packages/) while keeping the image size to an absolute minimum.

The convenience of `apt-get install` but for Busybox!

## Using and installing packages

This image is meant to be used as the base image for Busybox-based containers. It includes glibc, uclibc, and opkg with an easy-to-use wrapper for installing packages from your Dockerfiles:

	FROM progrium/busybox
	RUN opkg-install curl bash git
	CMD ["/bin/bash"]

The above Dockerfile grabs the latest package index during build, installs curl, bash, git, all their dependencies, and then deletes the local package index. **The result is a Docker image that's only 10MB.** Not too shabby.

Compare that to a minimal Ubuntu 12.04 (which comes with curl, bash) after installing git: 300MB. 

## Customizing buildroot configuration (Advanced)

If you want more control over how the rootfs is produced by customizing the buildroot config, there is some great tooling and an easy workflow. Delete the `rootfs.tar` file, then:

	$ cd rootfs
	$ make config

This will run an interactive menu inside a Docker container to configure buildroot. The resulting config will be placed at `rootfs/config`. Now go back up and rebuild:

	$ cd ..
	$ make build

This will cause buildroot to run again using [rootbuilder](https://github.com/progrium/rootbuilder) and your config. Building will likely take a while. The result will not only be a new `rootfs.tar`, but a new local Docker image tagged `busybox`. 

## Sponsor

This project was made possible thanks to [DigitalOcean](http://digitalocean.com).

## License

BSD
