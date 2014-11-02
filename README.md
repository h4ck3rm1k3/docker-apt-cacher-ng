# Table of Contents
- [Introduction](#introduction)
- [Contributing](#contributing)
- [Installation](#installation)
- [Quick Start](#quick-start)
- [Data Store](#data-store)

# Introduction
Dockerfile to build a apt-cacher-ng container in a debian experimental env

# Contributing

If you find this image useful here's how you can help:

- Send a Pull Request with your awesome new features and bug fixes
- Help new users with [Issues](https://github.com/h4ck3rm1k3/docker-apt-cacher-ng/issues) they may encounter
- Send me a tip on [Gittip](https://gittip.com/h4ck3rm1k3/) or using Bitcoin at
  **bf449be439f5949c5f0d254b5c15728c** or **1F5XhHPgYCHSt7Zj7Xxt8QZSYcsG5U7SuQ**
  https://fmtyewtk.blogspot.com/2012/01/donations.html

# Installation

build the image yourself.

```
git clone https://github.com/h4ck3rm1k3/docker-apt-cacher-ng.git
cd docker-apt-cacher-ng
make
```

# Quick Start
Run the image

```
make run
```

To enabling caching on the host create the file `/etc/apt/apt.conf.d/01proxy` with the following content:
```
Acquire::http { Proxy "http://127.0.0.1:3142"; };
```

Similarly to enable caching in your docker containers you can add the following line in your Dockerfile so that the cache is made use of during package installation.

```dockerfile
RUN echo 'Acquire::http { Proxy "http://172.17.42.1:3142"; };' >> /etc/apt/apt.conf.d/01proxy
```

# Data Store
You should mount a volume at `/var/cache/apt-cacher-ng` so that you can reuse the existing cache if the container is stopped and started.

```
docker run --name='apt-cacher-ng' -d -p 3142:3142 \
-v /opt/apt-cacher-ng:/var/cache/apt-cacher-ng \
sameersbn/apt-cacher-ng:latest
```


# See Also 
https://www.digitalocean.com/community/tutorials/docker-explained-how-to-create-docker-containers-running-memcached
