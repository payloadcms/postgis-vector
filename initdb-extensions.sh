#!/bin/bash

set -e

# Load additional extensions into database
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
  CREATE EXTENSION IF NOT EXISTS pg_uuidv7;
  ALTER EXTENSION pg_uuidv7 UPDATE;
  CREATE EXTENSION IF NOT EXISTS vector;
  ALTER EXTENSION vector UPDATE;
EOSQL