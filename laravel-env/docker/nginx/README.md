## Nginx

To build the nginx image run `docker-compose build web`

To enter the running Nginx container `docker-compose exec web /bin/sh`
This will access the container into the current working directory which is `/var/www/html`

To view the nginx configuration in the nginx container `cat /etc/nginx/nginx.conf`

To view the app configuration in the nginx container  `cat /etc/nginx/conf.d/app.conf` 

To access the logs in the container  `ls -lah /var/log/nginx`

To watch logs when running in the apache container in detached mode `docker logs -f nginx`