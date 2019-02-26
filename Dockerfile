FROM node:11
LABEL maintainer='naveen'
COPY /devconnector_final /devconnector_final
WORKDIR /devconnector_final
RUN npm install && cd client && npm install && npm install pm2 -g
CMD pm2 start npm --name "server" -- run {dev} && cd client && pm2 start npm --name "client" -- start && pm2 logs