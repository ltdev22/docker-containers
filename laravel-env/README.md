# Laravel Environment

Laravel (dev) environment setup on docker with each component (web server, php, db etc) to be on a separate container.

 Run `docker-compose up` and optionaly add the `-d` option at the end to run on detached mode to launch the application. By default 
 the Laravel app lives inside the *codebase* folder. The *docker* folder contains a list of sub-folders, each sub-folder has the dockerfiles for the required images and the configuration for each of the containers to be generated. In each sub-folder there's also a README.md file with info and a list of commands to use for the containers.

 To stop the docker containers run `docker-compose stop` or *ctrl+c* if running on the foreground, or kill the containers using `docker-compose down -v`

List of containers:
- Web server (Apache or Nginx)
- PHP fpm v8.* 
- MySQL or MariaDB
- Composer
- NPM
- Artisan
- Redis
- PHPUnit

### DB Connection

The variables in *.env* file inside the Laravel application:
```
DB_CONNECTION=mysql
DB_HOST=mysql
DB_PORT=3306
DB_DATABASE=database_name_goes_here
DB_USERNAME=laravel
DB_PASSWORD=secret
```

For the docker-compose.yml file or the ./docker/docker.env variables:
```
MYSQL_DATABASE: database_name_goes_here
MYSQL_USER: laravel
MYSQL_PASSWORD: secret
MYSQL_ROOT_PASSWORD: root
```

These can be used also for the setting up the connection on a gui tool like TablePlus, SequelPro or MySQL Workbench. Will need to specify also ports and host
```
Host: 127.0.0.1 or 0.0.0.0
Port: 4306
```


### NPM

To run any npm commands we would need to run the npm container and then terminate it. So we can run commands like these examples:
- `docker-compose run --rm npm install`
- To install any npm packages `docker-compose run --rm npm install --save-dev v-money`
- To compile assets `docker-compose run --rm npm run dev`
- To watch any changes `docker-compose run --rm npm run watch`


### Redis
- the php extension needs to be installed (uncomment the code on php/Dockerfile)
- the redis container is also available (uncomment the *redis* service in docker-compose.yml)
- install the Laravel-Redis extension `docker-compose run --rm composer require predis/predis
- set REDIS_HOST=redis in *.env* in Laravel application