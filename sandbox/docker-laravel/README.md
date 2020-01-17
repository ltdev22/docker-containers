# Cheat Sheets

### To start with

`docker build -t docker-laravel-lamp -f docker/Dockerfile`

`docker run --rm -it docker-laravel-lamp bash`

To see apache configuration

`$ apachectl -S`



On new terminal tab

`docker ps`   to get the container ID / name



If you try probably will fail

`docker cp <container ID>:/etc/apache2/sites-enabled/000-default.conf docker/vhost.conf`



So in running container tab do

`$ ls -la /etc/apache2/sites-enabled/000-default.conf`

`$ cd cd /etc/apache2/sites-available/`



And copy this path instead, which should be /etc/apache2/sites-available

`$ pwd`



So in the new tab do this to get the conf file

`docker cp <container ID>:/etc/apache2/sites-available/000-default.conf docker/vhost.conf`




After copying the docker/vhost.conf in the Dockerfile stop running container and build image again

`docker stop <container name>`

`docker build -t docker-laravel-lamp -f docker/Dockerfile .`

`docker run --rm -p 9000:80 docker-laravel-lamp`




At this point we need to fix the permission denied error. So if we do

`docker exec -it <container ID> bash`

`$ ls -lah`




We 'll see that the files owned by root user & group. We need to change to run by apache user so in the Dockerfile RUN this

`chown -R www-data:www-data /var/www/html`




Then we need to stop all containers and rebuild image

`docker stop $(docker ps -aq)`

`docker build -t docker-laravel-lamp -f docker/Dockerfile .`




So if we do these, we should see the app owened by the www-data user & group

`docker run --rm -d -p 9000:80 docker-laravel-lamp`

`docker exec -it <container id>`

`$ ls -la`




To enable rewrite mode

`docker run --rm -it -p 9000:80 docker-laravel-lamp bash` if not running the container already

`$ a2enmod`



So to add in the Dockerfile and rebuild the image

`$ a2enmod rewrite`  to enable rewrite mod

`docker build -t docker-laravel-lamp -f docker/Dockerfile .`




(Optional) if you want to disable htaccess and move the rules of mod rewrite in vhost configuration
@todo add this in vhost and copy the mod rewrite from htaccess in it in order to work the rewrite module again

```
<Directory /var/www/html/public>
    AllowOverride none
</Directory>
```


### To run migrations (through the app container)

`docker-compose --build up -d`

`docker-compose exec app bash`



To check if the pdo_mysql extension is installed

`$ php -m | grep mysql`



If yes, then you should be good to run 

`$ php artisan migrate`



### To connect to redis (You need to learn redis at some point!)

`redis-cli -h 127.0.0.1 -p 6379 (or 16379)`

`$> GET test // should return nil`

`$> SET test 1`



**Don't forget!! you need to set REDIS_HOST=redis, SESSION_DRIVER=redis, QUEUE_DRIVER=redis & CACHE_DRIVER=redis in .env**



Next isntall the predis package

`composer require predis/predis`

`docker-compose build app`

`docker-compose up -d`

`docker-compose exec app bash`

`$ php artisan tinker`

`$ \Redis::get('test');`




### To install xdebug you need to do in the Dockerfile

`pecl install xdebug`

`docker-php-ext-enable xdebug`



And build the image again off course

`docker-compose build (app)`


So to list the xdebug.ini file you 'd do

`docker-compose run app bash`

`$ php --ini`




To make the xdebug config more flexible, we create a .docker.env (don't forget to gitignore it) & .docker.env.example files
and create ENV variables which we can use to assign in the config off course we need to rebuild again, so

`docker-compose build app`


To see logs for scheduler and queue

`docker-compose logs -f scheduler/queue`



To add a php.ini file, if you do -> check for Loaded configuration file

`docker-compose exec app bash`

`$ php --ini`
