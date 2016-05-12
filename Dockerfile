FROM debian:jessie
MAINTAINER Denis Baryshev <dennybaa@gmail.com>

# Pin container build to the specified versions only
ENV VERSION=1.21

RUN echo "deb http://repo.pritunl.com/stable/apt jessie main" > /etc/apt/sources.list.d/pritunl.list && \
      apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv CF8E292A && apt-get update

RUN version=$(apt-cache show pritunl | grep Version: | sed 's/Version: //' | grep $VERSION) && \
        apt-get install -y pritunl=$version iptables ca-certificates

# Add my_init
ADD https://github.com/phusion/baseimage-docker/raw/master/image/bin/my_init /sbin/my_init
ADD entrypoint.sh /
ADD my_init.d /etc/my_init.d

EXPOSE 443 1194 

CMD [ "/entrypoint.sh" ]
