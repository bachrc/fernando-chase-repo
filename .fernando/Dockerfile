FROM node:alpine

COPY . /app/fernando-chase
WORKDIR /app/fernando-chase

RUN apk update
RUN apk upgrade
RUN apk add bash

RUN npm install