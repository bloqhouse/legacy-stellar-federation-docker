FROM node:alpine

LABEL author phra

ENV LEDGER_PORT ${LEDGER_PORT}

WORKDIR /app

COPY . .

RUN yarn

CMD yarn start
