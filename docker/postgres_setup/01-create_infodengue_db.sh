#!/bin/bash
set -e
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE DATABASE infodengue WITH OWNER dengueadmin ENCODING 'utf-8';
EOSQL

gunzip -c docker/dev_dumps/demodb_infodengue.sql.gz | psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname=infodengue
