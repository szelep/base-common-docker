#!/usr/bin/env bash

composer install
php bin/console lexik:jwt:generate-keypair --overwrite --no-interaction
php bin/console doctrine:migrations:migrate --no-interaction
php-fpm
