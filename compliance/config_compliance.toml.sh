echo external_port = ${HTTP_PORT_EXTERNAL}
echo internal_port = ${HTTP_PORT_INTERNAL}
echo # Set this to `true` if you need to check the information of a person receiving
echo # a payment you are sending (if false, only the sender will be checked). For
echo # more information, see the callbacks section below.
echo [database]
echo type = "\"${DB_TYPE}\"" # Or "postgres" if you created a PostgreSQL database
echo url = "\"${DB_URI}\""
echo 
echo [keys]
echo # This should be the secret seed for your base account (or another account that
echo # can authorize transactions from your base account).
echo signing_seed = "\"${SIGNING_KEY}\""
echo encryption_key = "\"${ENCRYPTION_KEY}\""
echo 
echo [callbacks]
echo sanctions = "\"${SANCTIONS_URL}\""
echo ask_user = "\"${ASK_USER_URL}\""
echo fetch_info = "\"${FETCH_INFO_URL}\""
echo 
echo # The compliance server must be available via HTTPS. Specify your SSL
echo # certificate and key here. If the server is behind a proxy or load  balancer
echo # that implements HTTPS, you can omit this section.
echo # [tls]
echo # certificate-file = "/etc/letsencrypt/live/stockify.io/fullchain.pem"
echo # private-key-file = "/etc/letsencrypt/live/stockify.io/privkey.pem"
