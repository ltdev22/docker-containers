FROM nginx:stable-alpine

COPY ./docker/nginx/conf.d/app.conf /etc/nginx/conf.d/default.conf
COPY ./docker/nginx/conf.d/*.conf /etc/nginx/conf.d/


WORKDIR /var/www/html
COPY ./public /var/www/html/public

RUN chown -R www-data:www-data /var/www/html