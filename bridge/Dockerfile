FROM golang:alpine

LABEL author phra

ARG BRIDGE_VERSION

WORKDIR /

RUN wget -O bridge.tar.gz https://github.com/stellar/bridge-server/releases/download/v${BRIDGE_VERSION}/bridge-v${BRIDGE_VERSION}-linux-amd64.tar.gz

RUN tar xf bridge.tar.gz

WORKDIR /bridge-v${BRIDGE_VERSION}-linux-amd64

RUN chmod u+x bridge

COPY bridge.cfg.sh .

CMD sh bridge.cfg.sh > bridge.cfg && ./bridge --migrate-db && ./bridge
