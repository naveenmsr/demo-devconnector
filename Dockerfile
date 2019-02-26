FROM node:11
LABEL maintainer='naveen'
COPY ./devconnector /devconnector
WORKDIR /devconnector
RUN npm install && cd client && npm install && npm install pm2 -g
CMD pm2 start npm --name "server" -- run {dev} && cd client && pm2 start npm --name "client" -- start && pm2 logs