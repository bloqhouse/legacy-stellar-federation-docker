FROM debian:sid-slim

LABEL author phra

ARG FEDERATION_VERSION

ENV FEDERATION_VERSION ${FEDERATION_VERSION}
ENV DB_TYPE ${DB_TYPE}
ENV DB_URI ${DB_URI}
ENV FEDERATION_PORT ${FEDERATION_PORT}
ENV DOMAIN ${DOMAIN}
ENV ISSUER ${ISSUER}

RUN apt-get update && apt-get dist-upgrade -y && apt-get install wget postgresql-client -y

WORKDIR /

RUN wget -O federation.tar.gz https://github.com/stellar/go/releases/download/federation-v${FEDERATION_VERSION}/federation-v${FEDERATION_VERSION}-linux-amd64.tar.gz

RUN tar xf federation.tar.gz

WORKDIR /federation-v${FEDERATION_VERSION}-linux-amd64

RUN chmod u+x federation

COPY federation.cfg.sh .

COPY migrate_db.sh .

CMD sh federation.cfg.sh > federation.cfg && sh migrate_db.sh && ./federation
