FROM golang:alpine

LABEL author phra

ARG FEDERATION_VERSION

WORKDIR /

RUN wget -O federation.tar.gz https://github.com/stellar/go/releases/download/federation-v${FEDERATION_VERSION}/federation-v${FEDERATION_VERSION}-linux-amd64.tar.gz

RUN tar xf federation.tar.gz

WORKDIR /federation-v${FEDERATION_VERSION}-linux-amd64

RUN chmod u+x federation

COPY federation.cfg.sh .

CMD sh federation.cfg.sh > federation.cfg && ./federation
