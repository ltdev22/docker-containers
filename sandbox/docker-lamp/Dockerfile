FROM php:7.2-apache-stretch

# install php modules and enable rewrite and negotiation modules (for routing)
RUN docker-php-ext-install pdo_mysql opcache \
    && a2enmod rewrite negotiation

COPY docker/php/php.ini /usr/local/etc/php/php.ini
COPY docker/apache/vhost.conf /etc/apache2/sites-available/000-default.conf
# copy the app in the container but not in default path 
COPY . /srv/app

WORKDIR /srv/app
