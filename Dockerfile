FROM node:slim

ENV NPM_CONFIG_LOGLEVEL info
ENV NODE_VERSION 6.11.4

RUN addgroup -g 1000 node \
    && adduser -u 1000 -G node -s /bin/sh -D node \

RUN [ "npm", "install" ]
CMD [ "npm", "start" ]