FROM php:7.3-apache-stretch

# Install required php modules
RUN docker-php-ext-install pdo_mysql \
    mysqli \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug \
    && a2enmod rewrite

# Install Composer programmatically (https://getcomposer.org/doc/faqs/how-to-install-composer-programmatically.md)
COPY docker/composer-installer.sh /usr/local/bin/composer-installer
RUN apt-get -yqq update \
    && apt-get -yqq install --no-install-recommends zip unzip \
    && chmod +x /usr/local/bin/composer-installer \
    && composer-installer \
    && mv composer.phar /usr/local/bin/composer \
    && chmod +x /usr/local/bin/composer \
    && composer --version


# Add additional configuration
COPY docker/vhost.conf /etc/apache2/sites-available/000-default.conf
COPY docker/config/php/php.ini /usr/local/etc/php/php.ini
COPY docker/config/php/conf.d/*.ini /usr/local/etc/php/conf.d/
COPY docker/start.sh /usr/local/bin/start
COPY . /var/www/html

# Set working dir
WORKDIR /var/www/html/

# Fix permission denied errors - ensure apache owns these files
RUN chown -R www-data:www-data /var/www/html \
    && chmod +x /usr/local/bin/start

CMD ["/usr/local/bin/start"]