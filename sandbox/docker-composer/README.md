# Cheat Sheets

## Using Composer

## TIP: try to keep the commands for installing composer and caching dependencies higher in the Dockerfile!


Build the dockerfile

`docker build -t php_composer:latest -f docker/Dockerfile .`

To run the container and check composer once installed with which composer

`docker run --rm -it php_composer:latest bash`


For when caching composer dependencies:
after building and running the container

`ls -la` (should be inside /tmp folder)

`ls -la ~/.composer` should list a cache folder

`ls -la ~/.composer/cache/files`  should list all dependencies inside this image
