psql -c "CREATE TABLE IF NOT EXISTS accounts (id BIGSERIAL PRIMARY KEY, first_name VARCHAR(20) NOT NULL, last_name VARCHAR(20) NOT NULL, friendly_id VARCHAR(20) NOT NULL);" ${DB_URI}
psql -c "INSERT INTO accounts (first_name, last_name, friendly_id) VALUES ('tim','rutgers','tim_rutgers'),('koen','bonenkamp','koen_bonenkamp'), ('francesco', 'soncina', 'phra') ON CONFLICT DO NOTHING;" ${DB_URI}
