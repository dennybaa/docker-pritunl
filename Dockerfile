FROM gliderlabs/alpine
MAINTAINER Denis Baryshev <dennybaa@gmail.com>

RUN apk update && apk add libffi openssl ca-certificates \
        python net-tools openvpn bridge-utils

RUN wget -qO- https://bootstrap.pypa.io/get-pip.py | python

# Add compiled wheels for alpine
ADD wheels /wheels

RUN pip install --no-index -f /wheels -r /wheels/requirements.txt && \
      pip install --no-index -f /wheels pritunl

EXPOSE 9700
EXPOSE 1194
EXPOSE 11194
