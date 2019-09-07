FROM node:8.10.0

RUN mkdir -p /app/frontend
RUN mkdir /app/public

COPY . /app/frontend
RUN ls -la /app/frontend

WORKDIR /app/frontend

RUN npm i
RUN npm run deploy
