shell:
	sudo docker run -it --rm -v $(PWD):/mnt -w /mnt --network host  node:20.10.0-bookworm bash

build:
	sudo docker build -t erikluo/tools:latest .

