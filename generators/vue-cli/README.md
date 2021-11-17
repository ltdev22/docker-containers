# vue-cli
Scaffolding a vue app within a docker container.

## How to use
1. To build the docker image `docker build . -t vue-cli`
2. To run the scaffold `docker run -v ${PWD}:/app vue-cli vue create hello-world-app`
3. After scaffolding run `docker run -v ${PWD}:/app vue-cli npm i` to generate the package-lock.json file - for some reason this file is not generated at the moment.
