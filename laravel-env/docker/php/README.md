## PHP-FPM

To build the php image run `docker-compose build php`

To enter the running apache container `docker-compose exec php /bin/sh`
This will access the container into the current working directory which is `/var/www/html`

To view the php.ini in the container `ls -lah /usr/local/etc/php` and `cat /usr/local/etc/php/php.ini`

To view the additional *.ini* files `ls -lah /usr/local/etc/php/conf.d` 

To watch logs when running in the apache container in detached mode `docker logs -f php`


### Running artisan commands

Inside docker-compose.yml there's an *artisan* service which uses the same image like the *php* service does, 
but having a different entrypoint. The purpose of this container is to run any artisan commands and then terminate.
So, we can run any *artisan* commands like these for example:
- run artisan version: `docker-compose run --rm artisan --version` should output the Laravel version
- run any migrations: `docker-compose run --rm artisan migrate`
- create a model with a migration file: `docker-compose run --run artisan make:model Foo --migration`
  
Reminder: in order to run the migrations successfully we need to be suse we have set the DB_* variables in the *.env* file of the Laravel application.
See the main README.md file for more details.


### Running PHP Unit tests

Likewise with *artisan* container we can run the same way a *phpunit* container for running any tests we have
- `docker-compose run --rm phpunit`

Note that tests can be also run and through *artisan* as `docker-compose run --rm artisan test`, we just have another way of running ther on the packground.