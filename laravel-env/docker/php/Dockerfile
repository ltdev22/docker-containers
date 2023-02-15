FROM php:8.1-fpm-alpine

# Install any necessary alpine packages
RUN apk update && apk add --no-cache --update linux-headers \
    ${PHPIZE_DEPS} \
    zip \
    unzip \
    libzip-dev \
    openssh \
    freetype \
    libpng \
    libjpeg-turbo \
    freetype-dev \
    libpng-dev \
    jpeg-dev \
    libwebp-dev \
    libjpeg \
    libjpeg-turbo-dev

# Configure packages
RUN docker-php-ext-configure gd --enable-gd \
    --with-freetype=/usr/lib/ \
    --with-jpeg=/usr/lib/ \
    --with-webp=/usr

RUN NUMPROC=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) \
    && docker-php-ext-install -j${NUMPROC} gd

# Compile native PHP packages
RUN docker-php-ext-install \
    mysqli \
    pdo \
    pdo_mysql \
    exif

# Install additional packages from PECL like xdebug, redis etc ...
RUN pecl install zip xdebug \
    && docker-php-ext-enable zip xdebug \
    && pecl install igbinary \
    && docker-php-ext-enable igbinary \
    && yes | pecl install redis \
    && docker-php-ext-enable redis

# Set up the php configuration in the container
COPY ./docker/php/php.ini /usr/local/etc/php/php.ini
COPY ./docker/php/conf.d/*.ini /usr/local/etc/php/conf.d/

# Copy the codebase in the working dir of the container
WORKDIR /var/www/html
COPY . /var/www/html

RUN chown -R www-data:www-data /var/www/html

EXPOSE 9000
CMD ["php-fpm", "-y", "/usr/local/etc/php-fpm.conf", "-R"]