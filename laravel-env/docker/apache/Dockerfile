FROM httpd:alpine

ARG PROJECT_ROOT=${PROJECT_ROOT}
ENV PROJECT_ROOT=${PROJECT_ROOT}

COPY ./docker/apache/httpd-vhosts.conf /usr/local/apache2/conf/extra/httpd-vhosts.conf

# Update apache conf to include the vhost config
RUN sed -i 's,#Include conf/extra/httpd-vhosts.conf,Include conf/extra/httpd-vhosts.conf,g' /usr/local/apache2/conf/httpd.conf

WORKDIR /var/www/html/
RUN chown -R www-data:www-data /var/www/html

COPY ./${PROJECT_ROOT}/public /var/www/html/public

EXPOSE 80
CMD ["httpd", "-D", "FOREGROUND"]