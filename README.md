# Stellar Federation Docker

## Motivation

We have created this repository to be able to quickly deploy dummy stellar federations for demo and testing purposes. We decided to open source it to contribute to the Stellar community.

## Feature

- Federation
- Compliance
- Ledger
- nginx reverse proxy w/ automatic HTTPS certificate generation

## Prerequisites

You must ensure to have installed the following dependencies:

- Docker CE (https://www.docker.com/community-edition)
- Docker-compose (https://docs.docker.com/compose/)
- DNS entry pointing to the correct host (required for HTTPS certificate generation via [LetsEncrypt](https://letsencrypt.org/))

## Installation

You can clone the repository with the following command:

```
git clone https://github.com/bloqhouse/stellar-docker.git
```

or the following one if you have set up ssh keys on GitHub:

```
git clone git@github.com:bloqhouse/stellar-docker.git
```

## Configuration

This repository requires you to create a `.env` file in the project root directory in order to pass all the required environment variables:

```
# .env

# LETSENCRYPT STAGING ENV
# CHANGE IT TO true FOR DEVELOPMENT
LETSENCRYPT_STAGING=false

# PUBLIC
NGINX_SERVER_NAME=domain.com
NGINX_EMAIL=user@domain.com
BRIDGE_VERSION=0.0.30
FEDERATION_VERSION=0.2.1
COMPLIANCE_VERSION=0.0.30
BRIDGE_PORT=8001
FEDERATION_PORT=8002
COMPLIANCE_EXTERNAL_PORT=8003
COMPLIANCE_INTERNAL_PORT=8004
COMPLIANCE_NODE_PORT=8005
LEDGER_PORT=8006
HORIZON=https://horizon-testnet.stellar.org
PASSPHRASE=Test SDF Network ; September 2015
FEDERATION_URL=https://domain.com/federation/federation
COMPLIANCE_URL=https://domain.com/compliance
RECEIVE_URL=https://domain.com/ledger/receive
ISSUER=<ISSUER_ADDRESS>
RECEIVING_ACCOUNT=<RECEIVING_ACCOUNT_ADDRESS>
SANCTIONS_URL=https://domain.com/sanctions
ASK_USER_URL=https://domain.com/ask_user
FETCH_INFO_URL=https://domain.com/fetch_info
IMAGE_URL=https://domain.com/bloq.png
CURRENCY_CODE=XXX
CONDITIONS=Legal conditions...
DESC=Economic ownership of XXX assets
DECIMALS=0

# SQL FIXTURES
CREATE_ACCOUNTS_TABLE=CREATE TABLE IF NOT EXISTS accounts (id BIGSERIAL PRIMARY KEY, first_name VARCHAR(20) NOT NULL, last_name VARCHAR(20) NOT NULL, friendly_id VARCHAR(20) NOT NULL);
POPULATE_ACCOUNTS_TABLE=INSERT INTO accounts (first_name, last_name, friendly_id) VALUES ('name', 'surname', 'nickname') ON CONFLICT DO NOTHING;

# SECRETS
SECRET=<STRONG_PASSWORD>
BASE_SEED=<BASE_SEED>
SIGNING_SEED=<SIGNING_SEED>
ENCRYPTION_KEY=<ENCRYPTION_KEY>
```

## Usage

After having created the `.env` file you can build the containers running the following command:

```
docker-compose build
```

You can also omit to explicitly build the containers in a separate step and proceed to build and deploy with one command using:

```
docker-compose up -d
```

If you have set up correctly all the environment variables you should be able to access via HTTPS a fully working Stellar federation.
