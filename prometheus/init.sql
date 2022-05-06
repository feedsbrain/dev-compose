SELECT 'CREATE DATABASE timescale'
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'timescale')\gexec

\c timescale

CREATE EXTENSION IF NOT EXISTS timescaledb;
