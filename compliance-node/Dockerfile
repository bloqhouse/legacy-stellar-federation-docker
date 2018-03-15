FROM node:9-slim

LABEL author phra

ENV DOMAIN ${DOMAIN}
ENV COMPLIANCE_NODE_PORT ${COMPLIANCE_NODE_PORT}

RUN apt-get update && apt-get dist-upgrade -y

COPY . .

RUN yarn

CMD node compliance.js
