FROM php:fpm-alpine
RUN docker-php-ext-install pdo_mysql

# パッケージのインストール
RUN apk update \
    && apk add --no-cache --virtual .install-things unzip git

# phpunit のインストール
RUN curl -sSLO https://phar.phpunit.de/phpunit.phar \
    && chmod +x phpunit.phar \
    && mv phpunit.phar /usr/local/bin/phpunit

# 不要なパッケージの削除
RUN apk del .install-things

WORKDIR /var/www/html
