FROM golang:alpine

LABEL author phra

ARG BRIDGE_VERSION

ENV BRIDGE_VERSION ${BRIDGE_VERSION}
ENV HORIZON ${HORIZON}
ENV PASSPHRASE ${PASSPHRASE}
ENV DB_TYPE ${DB_TYPE}
ENV DB_URI ${DB_URI}
ENV HTTP_PORT ${HTTP_PORT}
ENV COMPLIANCE_URL ${COMPLIANCE_URL}
ENV RECEIVE_URL ${RECEIVE_URL}
ENV ASSET_CODE ${ASSET_CODE}
ENV ISSUER ${ISSUER}
ENV BASE_SEED ${BASE_SEED}
ENV RECEIVING_ACCOUNT ${RECEIVING_ACCOUNT}

WORKDIR /

RUN wget -O bridge.tar.gz https://github.com/stellar/bridge-server/releases/download/v${BRIDGE_VERSION}/bridge-v${BRIDGE_VERSION}-linux-amd64.tar.gz

RUN tar xf bridge.tar.gz

WORKDIR /bridge-v${BRIDGE_VERSION}-linux-amd64

RUN chmod u+x bridge

COPY bridge.cfg.sh .

CMD sh bridge.cfg.sh > bridge.cfg && ./bridge --migrate-db && ./bridge
