FROM node:7.7-alpine

RUN mkdir /app
WORKDIR /app

RUN npm install -g nodemon

COPY package.json package.json
RUN npm install && mv node_modules /node_modules

COPY . .

CMD node server.js
