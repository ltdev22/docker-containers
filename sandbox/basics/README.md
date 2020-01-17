# Docker cheat-sheet


### list all available options

`docker build -h`


### Build image with tag
notice the dot . at the end - this is build context which is the current working dir

`docker build -t phpinfo:latest .`

`docker build -t phpinfo:1.0.1 .`


### Run container
`docker run -it --rm phpinfo bash`

`docker run -p 9000:80 --rm phpinfo`

### Run commands inside a running container
 `docker exec -it <container id> bash`

e.g php --ini to get the .ini path and ctrl+d to exit the container

### to make some ini settings
`mkdir config`

`echo "date.timezone = Europe/London" >> config/php.ini`