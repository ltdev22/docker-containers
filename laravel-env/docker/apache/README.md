## Apache

To build the apache image run `docker-compose build web`

To enter the running apache container `docker-compose exec web /bin/sh`
This will access the container into the current working directory which is `/var/www/html`

To view the apache configuration `cat /usr/local/apache2/conf/httpd.conf`

To view the vhost configuration `cat /usr/local/apache2/conf/extra/httpd-vhosts.conf` 

To access the logs `ls -lah /usr/local/apache2/logs`

To watch logs when running in the apache container in detached mode `docker logs -f apache`