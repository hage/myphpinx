FROM php:fpm-alpine

# パッケージのインストール
RUN apk update \
    && apk add --no-cache unzip git zlib-dev libzip-dev

RUN docker-php-ext-install pdo_mysql bcmath zip

# composer のインストール
ENV COMPOSER_ALLOW_SUPERUSER 1
WORKDIR /var/php
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && php composer-setup.php && php -r "unlink('composer-setup.php');" &&  ln -s /var/php/composer.phar /usr/local/bin/composer

# phpunit のインストール
RUN curl -sSLO https://phar.phpunit.de/phpunit.phar \
    && chmod +x phpunit.phar \
    && mv phpunit.phar /usr/local/bin/phpunit

WORKDIR /var/www/html
