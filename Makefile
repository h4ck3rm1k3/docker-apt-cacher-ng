all: build

build:
	sudo docker build --tag=apt-cacher-ng .

run : 
	sudo docker run -d -p 3142:3142 -v /opt/apt-cacher-ng:/var/cache/apt-cacher-ng  apt-cacher-ng 

debug-run : 
	sudo docker run -i -p 3142:3142 -v /opt/apt-cacher-ng:/var/cache/apt-cacher-ng  apt-cacher-ng 

# --name=apt-cacher-ng2

shell:
	sudo docker run -i -t apt-cacher-ng /bin/bash -i
