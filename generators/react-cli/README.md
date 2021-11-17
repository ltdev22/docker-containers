# react-cli
Scaffolding a react app within a docker container.

## How to use
1. To build the docker image `docker build . -t react-cli`
2. To run the scaffold `docker run -v ${PWD}:/app react-cli create-react-app hello-world-app`
3. After scaffolding run `docker run -v ${PWD}:/app react-cli npm i` to generate the package-lock.json file - for some reason this file is not generated at the moment.
