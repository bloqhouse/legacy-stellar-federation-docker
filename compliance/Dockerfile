FROM debian:sid-slim

LABEL author phra

ARG COMPLIANCE_VERSION

ENV COMPLIANCE_VERSION ${COMPLIANCE_VERSION}
ENV DB_TYPE ${DB_TYPE}
ENV DB_URI ${DB_URI}
ENV HTTP_PORT_EXTERNAL ${HTTP_PORT_EXTERNAL}
ENV HTTP_PORT_INTERNAL ${HTTP_PORT_INTERNAL}
ENV SANCTIONS_URL ${SANCTIONS_URL}
ENV ASK_USER_URL ${ASK_USER_URL}
ENV FETCH_INFO_URL ${FETCH_INFO_URL}
ENV SIGNING_SEED ${SIGNING_SEED}
ENV ENCRYPTION_KEY ${ENCRYPTION_KEY}

WORKDIR /

RUN apt-get update && apt-get dist-upgrade -y && apt-get install wget -y

RUN wget -O compliance.tar.gz https://github.com/stellar/bridge-server/releases/download/v${COMPLIANCE_VERSION}/compliance-v${COMPLIANCE_VERSION}-linux-amd64.tar.gz

RUN tar xf compliance.tar.gz

WORKDIR /compliance-v${COMPLIANCE_VERSION}-linux-amd64

RUN chmod u+x compliance

COPY config_compliance.toml.sh .

CMD sh config_compliance.toml.sh > config_compliance.toml.sh && ./compliance --migrate-db && ./compliance
