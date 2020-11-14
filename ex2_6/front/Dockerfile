FROM ubuntu:latest

WORKDIR /app
EXPOSE 5000

RUN apt-get update && apt-get upgrade -y && apt-get install -y curl gnupg git
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash
RUN apt-get install -y nodejs
RUN git clone https://github.com/docker-hy/frontend-example-docker.git /app
RUN npm install
CMD npm start
