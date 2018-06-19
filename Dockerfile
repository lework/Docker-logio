FROM node:6.14.3-alpine
MAINTAINER Lework <lework@yeah.net>

ENV LOGIO_SERVICE=''

COPY entrypoint.sh  /usr/bin/entrypoint.sh

RUN apk --no-cache --virtual .build-deps add tzdata make g++ openssl python && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone && \
    npm install -g log.io --user 'root' && \
    chmod +x /usr/bin/entrypoint.sh && \
    apk del .build-deps && \
    rm -rf /var/cache/apk/* /tmp/*

EXPOSE 28777 28778

CMD /usr/bin/entrypoint.sh
