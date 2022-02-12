FROM php:8.1-fpm-alpine

# Install any additional dependencies like pdo, xdebug etc
RUN apk add --no-cache \
    $PHPIZE_DEPS \
    openssl-dev \
    && docker-php-ext-install pdo pdo_mysql \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug

# Set up the php configuration in the container
COPY docker/php/php.ini /usr/local/etc/php/php.ini
COPY docker/php/conf.d/*.ini /usr/local/etc/php/conf.d/

# Copy the codebase in the working dir of the container
WORKDIR /var/www/html
COPY ./codebase /var/www/html

RUN chown -R www-data:www-data /var/www/html

EXPOSE 9000
CMD ["php-fpm", "-y", "/usr/local/etc/php-fpm.conf", "-R"]