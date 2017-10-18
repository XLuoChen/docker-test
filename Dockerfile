FROM node:slim

ENV NPM_CONFIG_LOGLEVEL info
ENV NODE_VERSION 6.11.4

#RUN addgroup -g 1000 node \
 #   && adduser -u 1000 -G node -s /bin/sh -D node \
RUN apt-get update && apt-get install -y supervisor

RUN mkdir -p /app
WORKDIR /app

COPY ./ /app/

RUN [ "npm", "install" ]

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
EXPOSE 22 80
CMD ["/usr/bin/supervisord"]

CMD [ "npm", "start" ]