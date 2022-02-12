## Composer

To build the composer image run `docker-compose build composer`

To run the composer container `docker-compose run --rm composer COMMAND`
For example: 
- Create a new laravel project `docker-compose run --rm composer create-project laravel/laravel .` (*) 
- Install a new package: `docker-compose run --rm composer require spatie/laravel-permission`
- Dump autoload `docker-compose run --rm composer dump-autoload -o`

**Note:** The purpose of this container is to run the composer command we need and then stop imediately, that's why we pass the `--rm` option.

(*) When creating a new Laravel application we pass `.` instead of specifying the directory. That's because in the docker-compose.yml we use the
`working_dir` attribute to specify the WORKDIR for the composer container.