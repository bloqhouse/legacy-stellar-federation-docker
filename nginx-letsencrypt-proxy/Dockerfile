FROM nginx:latest

RUN echo "deb http://ftp.debian.org/debian jessie-backports main" \
  >> /etc/apt/sources.list; \
  apt-get update && apt-get install -y certbot -t jessie-backports

RUN update-ca-certificates

RUN mkdir -p /opt
RUN mkdir -p /etc/nginx/sites-available
RUN mkdir -p /etc/nginx/sites-enabled

WORKDIR /opt

COPY ./le.sh /opt
RUN chmod +x /opt/le.sh
COPY ./stellar.toml /usr/share/nginx/html
COPY ./site.conf /opt/site.conf

EXPOSE 80
EXPOSE 443

CMD [ "/opt/le.sh" ]
