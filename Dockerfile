FROM alpine:latest
MAINTAINER Ömer ÜCEL <omerucel@gmail.com>

RUN apk --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/main/ \
    add \
    libressl2.4-libssl \
    libressl2.4-libcrypto
RUN apk --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ \
    add \
    curl \
    bash \
    git \
    php7 \
    php7-fpm \
    php7-json \
    php7-pdo \
    php7-phar \
    php7-openssl \
    php7-pdo_mysql \
    php7-mcrypt \
    php7-opcache \
    php7-curl \
    php7-iconv \
    php7-mbstring \
    php7-zlib
RUN echo "PS1='[\u@\h:\w] $ '" > /root/.bashrc
RUN curl -sS https://getcomposer.org/installer | php7 && \
    mv composer.phar /usr/local/bin/composer
WORKDIR /data/project
CMD ["php-fpm7", "-F", "-R", "-O"]
