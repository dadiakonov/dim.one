# docker/containers/php/Dockerfile

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
        lsof \
        net-tools \
        build-essential \
        openssl \
        sudo \
        libcurl4-gnutls-dev \
        libssl-dev \
        libonig-dev \
        libicu-dev \
        libzip-dev \
        unzip \
        gnupg2

## Install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt update && \
    apt install -y --no-install-recommends \
        nodejs \
        yarn

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
        opcache \
        pdo_mysql

## Install PECL extensions
## see http://stackoverflow.com/a/8154466/291573) for usage of `printf`
RUN printf "\n" | pecl install xdebug && \
    docker-php-ext-enable xdebug

## Remove deafult configuration files
RUN rm /usr/local/etc/php/php.ini-production \
       /usr/local/etc/php/php.ini-development \
       /usr/local/etc/php-fpm.conf.default \
       /usr/local/etc/php-fpm.d/www.conf.default

## Copy development configuration files
COPY ./usr/local/etc/php/php.ini /usr/local/etc/php/php.ini
COPY ./usr/local/etc/php/conf.d/xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini

## Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --filename=composer --install-dir=/usr/local/bin && \
    composer clear-cache

## Add support for host.docker.internal
RUN RES="$(arp host.docker.internal 2>/dev/null; echo $?)"; \
    if [ ${RES} -ne "0" ]; then \
      sed -i '/#!/a netstat -rn | grep UG | tr -s " " | cut -d" " -f2 | sed "s/$/ host.docker.internal/" | sudo tee -a /etc/hosts' /usr/local/bin/docker-php-entrypoint; \
    fi

## Set working directory
WORKDIR /opt/dim
