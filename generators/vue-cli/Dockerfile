FROM node:lts-alpine
RUN npm install -g npm install -g @vue/cli
RUN mkdir /app
WORKDIR /app
ADD . /app

CMD ['npm', 'install']