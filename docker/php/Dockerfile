FROM php:8.1-fpm-alpine3.15 as php

ARG SOURCE_PATH

RUN apk update && \
    apk upgrade && \
    apk add --no-cache --progress \
      autoconf bash build-base git make nano libzip-dev ldb-dev libldap openldap-dev openssl \
      icu-dev postgresql-dev tzdata zip zlib-dev && \
    docker-php-ext-configure \
      intl && \
    docker-php-ext-install \
      intl opcache pdo_pgsql zip bcmath&& \
    docker-php-ext-enable \
      opcache

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
     php -r "if (hash_file('sha384', 'composer-setup.php') === '55ce33d7678c5a611085589f1f3ddf8b3c52d662cd01d4ba75c0ee0459970c2200a51f492d557530c71c15d8dba01eae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
     php composer-setup.php && \
     php -r "unlink('composer-setup.php');" && \
     mv composer.phar /usr/local/bin/composer;

ENV TZ='Europe/Warsaw'

RUN cp /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini

RUN mkdir -p ${SOURCE_PATH} && \
    adduser -Su 1001 webadmin -G www-data -h ${SOURCE_PATH} && \
    chown -R webadmin:www-data ${SOURCE_PATH} && \
    chmod -R 775 ${SOURCE_PATH} && \
    chmod -R g+s ${SOURCE_PATH}

COPY ./docker/docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

WORKDIR ${SOURCE_PATH}
