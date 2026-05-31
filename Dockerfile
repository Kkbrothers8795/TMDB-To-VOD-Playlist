FROM php:8.2-apache

RUN apt-get update && apt-get install -y \
    git \
    unzip \
    curl \
    libcurl4-openssl-dev \
    libzip-dev \
    libxml2-dev \
    libonig-dev \
    libicu-dev \
    zlib1g-dev \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install \
       curl \
       mysqli \
       pdo \
       pdo_mysql \
       zip \
       xml \
       simplexml \
       dom \
       mbstring \
       intl \
       gd \
       opcache

RUN a2enmod rewrite headers expires

COPY . /var/www/html/

RUN mkdir -p /var/www/html/sessions \
    && chmod -R 777 /var/www/html/sessions \
    && chmod -R 755 /var/www/html

WORKDIR /var/www/html

EXPOSE 80
EXPOSE 443
