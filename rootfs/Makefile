.PHONY: config

config:
	docker run -it progrium/rootbuilder make nconfig
	docker cp `docker ps -lq`:/tmp/buildroot/.config .
	docker rm `docker ps -lq`
	mv .config config
