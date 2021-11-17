FROM node:lts-alpine

LABEL maintainer="Lykourgos Tsirikos <lykourgos.tsirikos@gmail.com>"

RUN npm install -g create-react-app \
    create-react-native-app \
    react-native-cli

RUN mkdir /app
WORKDIR /app
ADD . /app

CMD ['npm', 'install']