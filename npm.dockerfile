
FROM node:8.9-alpine as node-angular-cli

LABEL authors="Sanu Sathyaseelan"

# install angular-cli as node user
RUN chown -R node:node /usr/local/lib/node_modules \
  && chown -R node:node /usr/local/bin

#Linux setup
RUN apk update \
  && apk add --update alpine-sdk git yarn \
  && apk del alpine-sdk \
  && rm -rf /tmp/* /var/cache/apk/* *.tar.gz ~/.npm \
  && npm cache verify \
  && sed -i -e "s/bin\/ash/bin\/sh/" /etc/passwd

USER node
RUN yarn global add @angular/cli@1.5.5 && \
    ng set --global packageManager=yarn
