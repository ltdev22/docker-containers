# vue-cli
Scaffolding a vue app within a docker container.

## How to use
1. To build the docker image `docker build . -t vue-cli` or `docker build . -t vue-cli -f Dockerfile.create` if the name of the dockerfile is different 
2. To run the scaffold we need to run first the container and then run the `vue create` command:
3. Run container `docker run -itd -v ${PWD}:/app --name create_vue vue-cli`
4. Run the vue create `docker exec -it create_vue vue create my-app-folder`
5. Stop the running container `docker stop create_vue` or `docker stop <container-id>`

If the ownership of the files and dirs are set as _root_ we won't be able to edit the files, so we need to run `sudo chown -R $USER:$(id -gn $USER) ./*`

After scaffolding we may need to run `docker run -v ${PWD}:/app vue-cli npm i` to generate the package-lock.json file - for some reason this file is not generated at the moment.
