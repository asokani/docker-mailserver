FROM mainlxc/ubuntu
MAINTAINER Asokani "https://github.com/asokani"

RUN apt-get update && \
  apt-get -y install postfix


CMD ["/sbin/my_init"]

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
 