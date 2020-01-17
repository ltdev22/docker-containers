# Cheat Sheets

## Create a basic lamp env (can use for Laravel, Lumen etc)


#### Create php and apache folders

`mkdir -p docker/{apache,php}`

`touch docker/php/php.ini`

#### To create a v-host file

first find where the file is located in the container

`docker run --rm -it php:7.2-apache-stretch bash`

`apachectl -S`

`ls -l /etc/apache2/sites-enabled/000-default.conf`

`ls -l /etc/apache2/sites-available/000-default.conf`


#### To copy the vhost from the container to the apache folder

ctrl+D to exit

`docker run --rm -d php:7.2-apache-stretch`

`docker ps`

`docker cp <container id>:/etc/apache2/sites-available/000-default.conf docker/apache/vhost.conf`

**Don't forget to build the image ;-)**

`docker-compose up --build`


#### To install php-modules now ..

first we need to run the php container and find the path of docker-php-ext-install command

`which docker-php-ext-install`

`cd into/the/folder `

`ls -la`  to list all

`php -m`  to list all php modules installed

`docker-php-ext-install pdo_mysql`   to install a php module inside the running container (so remember as soon as we exit the running container the module won't exist)

and build the image again.. ;-)

`docker-compose build`

`docker-compose up -d`

`docker-compose exec app bash`  to inspect: enter into the running container and then with php -m we shall see the module installed
