FROM php:7.2-apache-stretch

# The simplest way to instal Composer is (but it doesn't actually verify the installation) .. 
# RUN curl -sS https://getcomposer.org/installer \
#     | php -- --install-dir=/usr/local/bin --filename=composer \
#     && chmod +x /usr/local/bin/composer \
#     && composer --version

# So, we can also install composer programmatically (https://getcomposer.org/doc/faqs/how-to-install-composer-programmatically.md#how-do-i-install-composer-programmatically-)
COPY docker/composer-installer.sh /usr/local/bin/composer-installer
RUN apt-get -yqq update \
    && apt-get -yqq install --no-install-recommends zip unzip \
    && chmod +x /usr/local/bin/composer-installer \
    && composer-installer \
    && mv composer.phar /usr/local/bin/composer \
    && chmod +x /usr/local/bin/composer \
    && composer --version

# Nice tip: 
# Because everytime we run `docker run` composer is going to install dependencies from scratch, 
# it would be really nice to cache them! So to do this we need to: 
#       a. temporarily change the workdir  
#       b. copy the composer files (composer.json, composer.lock and any other json files from private packages e.g. auth.json)
#       c.`run composer install`
#       d.cache the dependencies
#       d.remove composer files
WORKDIR /tmp/
COPY composer.json compose.lock /tmp/
# Ah yes, forgot!.. for Laravel we need to create these folders too in order to proceed,
# otherwise it throws some errors when running composer install. (Haven't found a better solution at the moment)
# To see what folders need to create check autoload classmap in composer.json
RUN mkdir -p database/seeds database/factories
RUN composer install --no-interaction --no-plugins --no-scripts --prefer-dist \
    && rm -rf composer.json composer.lock vendor/ database/

# Now er can change again the workdir and run composer install again.
# should be quickly if no changes as composer will install dependencies from cache. Cool huh? ;)
WORKDIR /var/www/html/
COPY . /var/www/html

RUN composer install --no-interaction --no-plugins --no-scripts --prefer-dist
