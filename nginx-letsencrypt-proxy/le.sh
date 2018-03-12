#!/bin/bash
set -e

if [[ -z "${NGINX_EMAIL}" ]]; then
  echo 'NGINX_EMAIL is not specified. Aborting.'
  exit 1
fi

if [[ -z "${NGINX_SERVER_NAME}" ]]; then
  echo 'NGINX_SERVER_NAME is not specified. Aborting.'
  exit 1
fi

# if [[ -z "${NGINX_SERVER_NAME_LEDGER2}" ]]; then
#   echo 'NGINX_SERVER_NAME_LEDGER2 is not specified. Aborting.'
#   exit 1
# fi

echo 'Starting initial nginx config.'
service nginx start

echo "Testing whether DHParams exist."
mkdir -p '/opt/certs'
if [[ ! -f "/opt/certs/dhparam.pem" ]]; then

  echo "Generating DHParams."
  openssl dhparam \
    -out /opt/certs/dhparam.pem \
    2048

else
  echo "DHParams exist; skipping DHParam setup."
fi

echo "Testing whether letsencrypt has been initialized already."
if [[ ! -d "/etc/letsencrypt/live/${NGINX_SERVER_NAME}" ]]; then

  echo "Initializing letsencrypt with certbot for '${NGINX_SERVER_NAME}'."
  letsencrypt certonly \
    -a webroot \
    -m ${NGINX_EMAIL} \
    -d ${NGINX_SERVER_NAME} \
    --agree-tos \
    --webroot-path=/usr/share/nginx/html/

else
  echo "Letsencrypt has been initialized; skipping certbot setup."
fi

echo "Applying SSL enabled nginx config"
cat /opt/site.conf | \
  sed -e "s/\\\$SERVER_NAME/${NGINX_SERVER_NAME}/" | \
  sed -e "s/\\\$BRIDGE_PORT/${BRIDGE_PORT}/" | \
  sed -e "s/\\\$FEDERATION_PORT/${FEDERATION_PORT}/" | \
  sed -e "s/\\\$LEDGER_PORT/${LEDGER_PORT}/" | \
  sed -e "s/\\\$COMPLIANCE_EXTERNAL_PORT/${NGINX_COMPLIANCE_EXTERNAL_PORT}/" | \
  > /etc/nginx/conf.d/${NGINX_SERVER_NAME}.conf


# echo "Testing whether letsencrypt has been initialized already."
# if [[ ! -d "/etc/letsencrypt/live/${NGINX_SERVER_NAME_LEDGER2}" ]]; then

#   echo "Initializing letsencrypt with certbot for '${NGINX_SERVER_NAME_LEDGER2}'."
#   letsencrypt certonly \
#     -a webroot \
#     -m ${NGINX_EMAIL} \
#     -d ${NGINX_SERVER_NAME_LEDGER2} \
#     --agree-tos \
#     --webroot-path=/usr/share/nginx/html/

# else
#   echo "Letsencrypt has been initialized; skipping certbot setup."
# fi

# echo "Applying SSL enabled nginx config"
# mkdir -p /etc/nginx/sites-{available,enabled}
# cat /opt/site.conf | \
#   sed -e "s/\\\$SERVER_NAME/${NGINX_SERVER_NAME_LEDGER2}/" | \
#   sed -e "s/\\\$REVERSE_HOST/${NGINX_SERVER_NAME_LEDGER2%%.*}/" \
#   > /etc/nginx/conf.d/${NGINX_SERVER_NAME_LEDGER2}.conf

service nginx stop

echo "Restarting nginx"
exec nginx -g 'daemon off;'