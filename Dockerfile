FROM node:8.5-alpine

# install angular-cli as node user
RUN chown -R node:node /usr/local/lib/node_modules \
  && chown -R node:node /usr/local/bin

RUN apk update
RUN apk add yarn

USER node
RUN yarn global add @angular/cli@1.4.2

# set npm as default package manager for root
USER root
RUN ng set --global packageManager=yarn

# install chromium for headless browser tests
ENV CHROME_BIN=/usr/bin/chromium-browser
RUN apk add --no-cache chromium udev ttf-freefont
RUN apk add --no-cache bash git
