FROM debian:sid-slim

LABEL author phra

ARG FEDERATION_VERSION

ENV FEDERATION_VERSION ${FEDERATION_VERSION}
ENV DB_TYPE ${DB_TYPE}
ENV DB_URI ${DB_URI}
ENV FEDERATION_PORT ${FEDERATION_PORT}
ENV NGINX_SERVER_NAME ${GINX_SERVER_NAME}
ENV RECEIVING_ACCOUNT ${RECEIVING_ACCOUNT}
ENV CREATE_ACCOUNTS_TABLE ${CREATE_ACCOUNTS_TABLE}
ENv POPULATE_ACCOUNTS_TABLE $POPULATE_ACCOUNTS_TABLE

RUN apt-get update && apt-get dist-upgrade -y && apt-get install wget postgresql-client netcat-openbsd -y

WORKDIR /

RUN wget -O federation.tar.gz https://github.com/stellar/go/releases/download/federation-v${FEDERATION_VERSION}/federation-v${FEDERATION_VERSION}-linux-amd64.tar.gz

RUN tar xf federation.tar.gz

WORKDIR /federation-v${FEDERATION_VERSION}-linux-amd64

RUN chmod u+x federation

COPY federation.cfg.sh .

COPY migrate_db.sh .

CMD until nc -z postgres_federation 5432; do sleep 1; done && sh federation.cfg.sh > federation.cfg && sh migrate_db.sh && ./federation
