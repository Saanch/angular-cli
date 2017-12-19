FROM node:9.2.0-alpine

RUN apk update \
  && apk add --update alpine-sdk python \
  && apk add --no-cache bash git \
  && yarn global add @angular/cli@1.5.5 \
  && ng set --global packageManager=yarn \
  && apk del alpine-sdk python \
  && rm -rf /tmp/* /var/cache/apk/* *.tar.gz ~/.npm \
  && npm cache clean --force \
  && yarn cache clean \
  && sed -i -e "s/bin\/ash/bin\/sh/" /etc/passwd
