# docker/containers/php-fpm/Dockerfile

FROM php:7.4-fpm

ENV DEBIAN_FRONTEND=noninteractive

## Set health ckeck command
HEALTHCHECK --interval=30s --timeout=5s --retries=5 --start-period=1m \
    CMD lsof -i:9000

## Install compile dependencies
RUN apt update && \
    apt install -y --no-install-recommends \
        g++ \
        git \
        curl \
        libcurl4-gnutls-dev \
        libonig-dev \
        libicu-dev \
        libzip-dev \
        unzip

## Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

## Install PHP extensions required for Yii 2.0 Framework
RUN docker-php-ext-configure bcmath && \
    docker-php-ext-install -j$(nproc) \
        zip \
        curl \
        bcmath \
        intl \
        mbstring \
        pdo_mysql

## Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --filename=composer --install-dir=/usr/local/bin && \
    composer clear-cache

## Set working directory
WORKDIR /opt/dim.one

EXPOSE 9000
