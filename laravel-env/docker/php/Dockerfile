FROM php:8.1-fpm-alpine

# Install alpine packages required for the PHP extensions
RUN apk update && apk add --no-cache --update linux-headers ${PHPIZE_DEPS} && apk add --no-cache \
    libzip-dev \
    freetype-dev \
    libjpeg-turbo-dev \
    libpng-dev

# Install PHP extensions
RUN docker-php-ext-install \
    exif \
    opcache \
    mysqli \
    pdo \
    pdo_mysql \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd

# Install extensions via pecl
RUN pecl install redis \
    && pecl install xdebug \
    && docker-php-ext-enable redis xdebug

# Configure the PHP container
COPY ./docker/php/php.ini /usr/local/etc/php/php.ini
COPY ./docker/php/conf.d/*.ini /usr/local/etc/php/conf.d/

# Copy the codebase in the working dir of the container
WORKDIR /var/www/html
COPY . /var/www/html

# Make sure the app is owned by www-data user and group
RUN chown -R www-data:www-data /var/www/html
USER www-data

EXPOSE 9000
CMD ["php-fpm", "-y", "/usr/local/etc/php-fpm.conf", "-R"]
