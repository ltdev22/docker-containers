# node-cli

Scaffoling React and Vue applications within docker, not natively 😉

Image on dockerhub: `ltweb22/node_cli` - link [here](https://hub.docker.com/repository/docker/ltweb22/node_cli)

## How to use
Build the docker image `docker build . -t node_cli`

#### Scaffold a React app 
Run: `docker run -rm -v ${PWD}:/app node_cli create-react-app my-app`<br>
After scaffolding run `docker run -v ${PWD}:/app node_cli npm i` to generate the package-lock.json file - for some reason this file is not generated at the moment.

#### Scaffold a Vue app
Run: `docker run -rm -it -v ${PWD}:/app node_cli vue create my-app`


Note: After finishing the above steps run:
1. `docker ps` or `docker ps -a` to list the containers
2. `docker stop <name of container>` or `docker stop <container id>`
3. `docker rm <name of container>` or `docker rm <container id>`
