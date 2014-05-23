# progrium/busybox

This might not be the smallest Busybox container (4.8MB), but it has [opkg](http://wiki.openwrt.org/doc/techref/opkg), which means you can *very easily* install other [common packages](http://downloads.openwrt.org/snapshots/trunk/x86_64/packages/) while keeping the image footprint size to a minimum.

## Using and installing packages

This image is meant to be used as a base image for Busybox-based containers. It includes glibc, uclibc, and opkg with an easy-to-use wrapper for installing packages from your Dockerfiles:

	FROM progrium/busybox
	RUN opkg-install curl bash git
	CMD ["/bin/bash"]

The above Dockerfile grabs the latest package index during build, installs curl, bash, git, all their dependencies, and then deletes the local package index. The result is a Docker image that's only 10MB. Not too shabby.

## Sponsor

This project was made possible thanks to [DigitalOcean](http://digitalocean.com).

## License

BSD