FROM nginx:latest

LABEL author phra

ENV NGINX_SERVER_NAME ${NGINX_SERVER_NAME}
ENV NGINX_EMAIL ${NGINX_EMAIL}
ENV BRIDGE_PORT ${BRIDGE_PORT}
ENV FEDERATION_PORT ${FEDERATION_PORT}
ENV COMPLIANCE_EXTERNAL_PORT ${COMPLIANCE_EXTERNAL_PORT}
ENV COMPLIANCE_INTERNAL_PORT ${COMPLIANCE_INTERNAL_PORT}
ENV LEDGER_PORT ${LEDGER_PORT}

RUN echo "deb http://ftp.debian.org/debian jessie-backports main" \
  >> /etc/apt/sources.list; \
  apt-get update && \
  apt-get dist-upgrade -y &&\
  apt-get install -y certbot -t jessie-backports

RUN update-ca-certificates

RUN mkdir -p /opt
RUN mkdir -p /etc/nginx/sites-available
RUN mkdir -p /etc/nginx/sites-enabled

WORKDIR /opt

COPY ./le.sh /opt
RUN chmod +x /opt/le.sh
COPY stellar.toml /opt
COPY ./site.conf /opt/site.conf

EXPOSE 80
EXPOSE 443

CMD [ "/opt/le.sh" ]
