FROM php:fpm-alpine
RUN docker-php-ext-install pdo_mysql bcmath

# パッケージのインストール
RUN apk update \
    && apk add --no-cache --virtual .install-things unzip git

# composer のインストール
ENV COMPOSER_ALLOW_SUPERUSER 1
WORKDIR /var/php
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && php -r "if (hash_file('sha384', 'composer-setup.php') === '48e3236262b34d30969dca3c37281b3b4bbe3221bda826ac6a9a62d6444cdb0dcd0615698a5cbe587c3f0fe57a54d8f5') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && php composer-setup.php && php -r "unlink('composer-setup.php');" &&  ln -s /var/php/composer.phar /usr/local/bin/composer

# phpunit のインストール
RUN curl -sSLO https://phar.phpunit.de/phpunit.phar \
    && chmod +x phpunit.phar \
    && mv phpunit.phar /usr/local/bin/phpunit

# 不要なパッケージの削除
RUN apk del .install-things

WORKDIR /var/www/html
