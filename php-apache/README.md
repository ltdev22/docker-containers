# php7.x-apache image

Using php:7.x-apache-stretch image (latest v7.3). Composer is also installed.

#### Build image

`docker build -t php7.3-apache:latest -f docker/Dockerfile php7.3-apache`

#### Run container

`docker run --rm -it ltweb22/php7.3-apache:latest bash`
