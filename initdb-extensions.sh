#!/usr/bin/env bash

set -e

# Load additional extensions into database
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
  CREATE EXTENSION IF NOT EXISTS vector;
  ALTER EXTENSION vector UPDATE;
EOSQL