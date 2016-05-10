FROM gliderlabs/alpine
MAINTAINER Denis Baryshev <dennybaa@gmail.com>

RUN apk update && apk add libffi openssl ca-certificates \
        python net-tools openvpn bridge-utils

RUN wget -qO- https://bootstrap.pypa.io/get-pip.py | python

# Add my_init
ADD https://github.com/phusion/baseimage-docker/raw/master/image/bin/my_init /sbin/my_init
ADD entrypoint.sh /
ADD my_init.d /etc/my_init.d

# Add compiled wheels for alpine
ADD wheels /wheels

# Add go services and config
ADD pritunl-* /usr/local/bin/
ADD pritunl.conf /etc/pritunl.conf

RUN pip install --no-index -f /wheels -r /wheels/requirements.txt && \
      pip install --no-index -f /wheels pritunl

EXPOSE 9700
EXPOSE 1194
EXPOSE 11194

CMD [ "/entrypoint.sh" ]
