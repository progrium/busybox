.PHONY: config

config:
	docker run -it rootbuilder make nconfig
	docker cp `docker ps -lq`:/tmp/buildroot/.config .
	docker rm `docker ps -lq`
	mv .config config

build:
	docker build -t rootfs .
	docker run --rm rootfs cat /tmp/buildroot/output/images/rootfs.tar > rootfs.tar
	docker rmi rootfs
