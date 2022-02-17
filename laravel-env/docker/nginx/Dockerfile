FROM nginx:stable-alpine

ARG PROJECT_ROOT=${PROJECT_ROOT}
ENV PROJECT_ROOT=${PROJECT_ROOT}

COPY ./docker/nginx/conf.d/app.conf /etc/nginx/conf.d/default.conf
COPY ./docker/nginx/conf.d/*.conf /etc/nginx/conf.d/

WORKDIR /var/www/html
COPY ./${PROJECT_ROOT}/public /var/www/html/public