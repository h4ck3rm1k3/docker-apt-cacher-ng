all: build

build:
	sudo docker build --tag=apt-cacher-ng .

run : 
	sudo docker run --name=apt-cacher-ng2 apt-cacher-ng 
