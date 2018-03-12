FROM golang:alpine

LABEL author phra

ARG COMPLIANCE_VERSION

WORKDIR /

RUN wget -O compliance.tar.gz https://github.com/stellar/bridge-server/releases/download/v${COMPLIANCE_VERSION}/compliance-v${COMPLIANCE_VERSION}-linux-amd64.tar.gz

RUN tar xf compliance.tar.gz

WORKDIR /compliance-v${COMPLIANCE_VERSION}-linux-amd64

RUN chmod u+x compliance

COPY config_compliance.toml.sh .

CMD sh config_compliance.toml.sh > config_compliance.toml.sh && ./compliance --migrate-db && ./compliance
