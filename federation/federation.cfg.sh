echo port = ${FEDERATION_PORT}
echo
echo [database]
echo type = "\"${DB_TYPE}\""
echo dsn = "\"${DB_URI}\""
echo
echo [queries]
echo federation = "\"SELECT '${RECEIVING_ACCOUNT}' as id, friendly_id as memo, 'text' as memo_type FROM accounts WHERE friendly_id = ? AND ? = '${DOMAIN}'\""
echo reverse-federation = "\"SELECT friendly_id, '' as domain FROM accounts WHERE ? = ''\""
