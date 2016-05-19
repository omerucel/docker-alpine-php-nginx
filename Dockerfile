FROM alpine:latest
MAINTAINER Ömer ÜCEL <omerucel@gmail.com>

RUN apk update && apk add \
    nginx \
    php-fpm \
    php-json \
    php-pdo \
    php-phar \
    php-openssl \
    php-pdo_mysql \
    php-mcrypt \
    php-opcache \
    php-curl && \
    rm -rf /var/cache/apk/*

RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer && \
    curl https://yt-dl.org/downloads/2016.04.24/youtube-dl -o /usr/local/bin/youtube-dl && \
    chmod a+rx /usr/local/bin/youtube-dl
WORKDIR /data/project
CMD php-fpm -R && nginx
