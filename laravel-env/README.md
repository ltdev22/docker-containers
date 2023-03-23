# Laravel Environment

Laravel (dev) environment setup on docker with each component (web server, php, db etc) to be on a separate container.

## Docker
For running the app on Docker
1. Copy and add to the end of the .env file the environemnt variables from the docker.env.example file into the .env. Don't overwrite the existing ones!
2. The file `develop` is available for running terminal commands, `./develop -h`

## About Docker Containers

To build containers
```
./develop build         # builds all
./develop build web     # for both Apache and Nginx
./develop build php
./develop build composer
```

To start / stop all containers
```
docker-compose up
docker-compose up -d            # in detach mode
docker-compose up --build       # for building also all containers

docker-compose stop
docker-compose down
```

To access the running container. This will access the container into the current working directory which is `/var/www/html`
```
./develop exec web /bin/sh      # for Apache / Nginx
./develop exec php /bin/sh
```

To watch logs of specific service in detached mode
```
./develop logs -f web
./develop logs -f php
or
docker logs -f web
docker logs -f php
```

### Container specific

#### 1. Apache

To view the apache configuration (need to enter the running container first)
```
cat /usr/local/apache2/conf/httpd.conf
cat /usr/local/apache2/conf/extra/httpd-vhosts.conf
```

To access the logs
```
ls -lah /usr/local/apache2/logs
```

#### 2. Nginx

To view the nginx configuration
```
cat /etc/nginx/nginx.conf
cat /etc/nginx/conf.d/app.conf
```

To access the logs in the container
```
ls -lah /var/log/nginx
```
or in detached mode
```
docker logs -f nginx
```

#### 3. PHP-FPM

To view the php.ini and the additional .ini files in the container run (need to enter the running container first)
```
ls -lah /usr/local/etc/php
ls -lah /usr/local/etc/php/conf.d # additional ini files

cat /usr/local/etc/php/php.ini
```

#### 4. Artisan

To run any artisan commands
```
./develop artisan --version # outputs the Laravel version
./develop--run artisan make:model Foo --migration
./develop --rm artisan migrate
./develop artisan queue:work --queue=foo --tries=3 --stop-when-empty
./develop artisan schedule:work
```

__Note:__ to stop queue abd schedule will need to run `docker-compose stop CONTAINER_ID`

#### 5. Composer

__Note:__ For creating a new Laravel application
```
docker run --rm --interactive --tty --volume $PWD:/app composer create-project laravel/laravel .
```
After that, the composer can be accessible from the `composer` container or using in the terminal `./develop composer`.
To run any composer commands
```
./develop composer require require laravel/breeze --dev      # Install new package
./develop composer install -vvv
./develop composer dump-autoload -o
```

#### 5. Meilisearch

For setting up properly the Meilisearch service we need to use the following environment variables in the `.env` file
```
MEILISEARCH_HOST=http://127.0.0.1:7700
MEILISEARCH_KEY=masterKey
SCOUT_DRIVER=meilisearch
```
__Note:__ in order to run the imports to meilisearch make sure you use as `MEILISEARCH_HOST` the name of the service specified
on docker-compose.yml. For ref see [https://stackoverflow.com/questions/73710554/laravel-scout-meilisearch-with-docker](https://stackoverflow.com/questions/73710554/laravel-scout-meilisearch-with-docker)

Flushing and importing to meilisearch is done via artisan:
```
./develop artisan scout:flush "App\Models\Product"
./develop artisan scout:import "App\Models\Product"
```

__Note:__ these steps are required whenever we edit the method `\App\Models\Product:toSearchableArray()`

## Database

For the following 2 sections the env variables need to be replaced with the values that have been set in the `.env` file.

#### Setting up database connection and creating a new user
1. Run `docker-compose exec mysql /bin/bash`
2. Within the container run `mysql -u root -p` and provide the password for root user
3. To create a new user and grant priviledges run the query
    ```
    grant all privileges on `MYSQL_DATABASE`.* to 'MYSQL_USER'@'%' identified by 'MYSQL_PASSWORD';
    ```
4. Confirm the user has been created and also has the right privileges
    ```
    show grants for 'MYSQL_USER'@'%';
    ```
5. Once that done, the database can be accessed by simply typing `./develop mysql` which will access the container and automatically login with the new mysql user to the database of the app

#### Connecting to MySQL Gui (TablePlus, Sequel Pro, Mysql Workbench etc)
Replace the env variables with the values
1. Host `localhost` or `127.0.0.1`
2. User `MYSQL_USER`
3. Password `MYSQL_PASSWORD`
4. Database `MYSQL_DATABASE`
5. Port `4306`
