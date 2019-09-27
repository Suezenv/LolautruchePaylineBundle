FROM php:7.3.5

COPY --from=composer:1.8 /usr/bin/composer /usr/bin/composer

RUN apt update && apt install -y \
    libmcrypt-dev \
    libzip-dev \
    zip \
    git \
    && docker-php-ext-install -j$(nproc) \
    iconv \
    && pecl install \
    zip \
    mcrypt-1.0.2 \
    && docker-php-ext-enable \
    zip \
    opcache \
    mcrypt

RUN apt install -y libxml2-dev && docker-php-ext-install -j$(nproc) soap && docker-php-ext-enable soap

RUN rm -r /var/lib/apt/lists/*
