FROM node:lts-alpine

RUN npm install -g create-react-app \
    create-react-native-app \
    react-native-cli

RUN npm install -g @vue/cli

RUN mkdir /app
WORKDIR /app
ADD . /app

CMD ["npm", "install"]