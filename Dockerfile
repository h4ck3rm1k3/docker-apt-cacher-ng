FROM debian:sid
MAINTAINER James Michael DuPont <h4ck3rm1k3@thefr33.com>
RUN echo "deb  http://ftp.utexas.edu/debian/ sid main contrib " > /etc/apt/sources.list
RUN echo "deb http://ftp.utexas.edu/debian/ experimental main" >> /etc/apt/sources.list
RUN apt-get -y update
RUN apt-get install -y apt-utils 
RUN apt-get install -t experimental -y apt-cacher-ng \
 && sed 's/# ForeGround: 0/ForeGround: 1/' -i /etc/apt-cacher-ng/acng.conf \
 && rm -rf /var/lib/apt/lists/* # 20140918

ADD start.sh /start.sh
RUN chmod 755 /start.sh
RUN apt-get -y update
RUN apt-get install -y sudo
EXPOSE 3142
VOLUME ["/var/cache/apt-cacher-ng"]
CMD ["/start.sh"]
