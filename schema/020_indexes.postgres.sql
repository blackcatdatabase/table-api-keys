-- Auto-generated from schema-map-postgres.yaml (map@sha1:8C4F2BC1C4D22EE71E27B5A7968C71E32D8D884D)
-- engine: postgres
-- table:  api_keys

CREATE INDEX IF NOT EXISTS idx_api_keys_tenant ON api_keys (tenant_id);

CREATE INDEX IF NOT EXISTS idx_api_keys_user   ON api_keys (user_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_api_keys_token ON api_keys (token_hash);

CREATE UNIQUE INDEX IF NOT EXISTS ux_api_keys_tenant_name ON api_keys (tenant_id, name_ci);

CREATE UNIQUE INDEX IF NOT EXISTS ux_api_keys_tenant_id ON api_keys (tenant_id, id);
