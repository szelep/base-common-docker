FROM node:lts-buster-slim

WORKDIR /app

COPY ./projects/ui/package.json .
COPY ./projects/ui/yarn.lock .
COPY ./projects/ui/public ./public

RUN apt update \
    && apt upgrade --assume-yes \
    && apt install --assume-yes git

RUN yarn install

EXPOSE 3000

CMD ["yarn", "start"]
