echo port = ${HTTP_PORT}
echo compliance = "\"${COMPLIANCE_URL}\""
echo horizon = "\"${HORIZON}\""
echo network_passphrase = "\"${PASSPHRASE}\""
echo # We'll fill this in once we set up a compliance server
echo 
echo # This describes the assets that can be sent and received.
echo # Repeat this section to add support for more asset types.
echo [[assets]]
echo code="\"${ASSET_CODE}\""
echo issuer="\"${ISSUER}\""
echo 
echo [database]
echo type = "\"${DB_TYPE}\""  # or "postgres" if you created a postgres database
echo url = "\"${DB_URI}\""
echo 
echo [accounts]
echo # The secret seed for your base account, from which payments are made
echo base_seed = "\"${BASE_SEED}\""
echo # The account ID that receives payments on behalf of your customers. In this
echo # case, it is the account ID that matches `base_seed` above.
echo receiving_account_id = "\"${RECEIVING_ACCOUNT}\""
echo # A secret seed that can authorize trustlines for assets you issue. For more,
echo # see https://stellar.org/developers/guides/concepts/assets.html#controlling-asset-holders
echo authorizing_seed = "\"${BASE_SEED}\""
echo # The ID of the account that issues your assets
echo issuing_account_id = "\"${ISSUER}\""
echo 
echo [callbacks]
echo # The server will send POST requests to this URL to notify you of payments
echo receive = "\"${RECEIVE_URL}\""
