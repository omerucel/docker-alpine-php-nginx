FROM alpine:latest
MAINTAINER Ömer ÜCEL <omerucel@gmail.com>

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
    php7-zlib \
    php7-session && \
    echo "PS1='[\u@\h:\w] $ '" > /root/.bashrc && \
    ln -s /usr/sbin/php-fpm7 /usr/sbin/php-fpm && \
    curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer
WORKDIR /data/project
CMD ["php-fpm", "-F", "-R", "-O"]
