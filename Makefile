all: build

build:
	sudo docker build --tag=apt-cacher-ng .

run : 
	sudo docker run --name=apt-cacher-ng2 -d -p 3142:3142 -v /opt/apt-cacher-ng:/var/cache/apt-cacher-ng  apt-cacher-ng 
