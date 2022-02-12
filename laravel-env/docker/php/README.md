## PHP-FPM

To build the php image run `docker-compose build php`

To enter the running apache container `docker-compose exec php /bin/sh`
This will access the container into the current working directory which is `/var/www/html`

To view the php.ini in the container `ls -lah /usr/local/etc/php` and `cat /usr/local/etc/php/php.ini`

To view the additional *.ini* files `ls -lah /usr/local/etc/php/conf.d` 

To watch logs when running in the apache container in detached mode `docker logs -f php`