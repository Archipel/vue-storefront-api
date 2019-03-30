FROM node:10-alpine

ENV VS_ENV prod

WORKDIR /var/www

RUN apk add --no-cache curl git

COPY package.json ./
COPY ecosystem.json ./
COPY docker/vue-storefront-api/vue-storefront-api.sh /usr/local/bin/
RUN mkdir config migrations scripts src var
COPY config config
COPY migrations migrations
COPY scripts scripts
COPY src src
COPY var var

RUN apk add --no-cache --virtual .build-deps ca-certificates wget && \
    yarn install --no-cache && \
    apk del .build-deps

CMD ["vue-storefront-api.sh"]
