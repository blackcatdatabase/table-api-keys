-- Auto-generated from schema-map-postgres.yaml (map@sha1:8C4F2BC1C4D22EE71E27B5A7968C71E32D8D884D)
-- engine: postgres
-- table:  api_keys

ALTER TABLE api_keys ADD CONSTRAINT fk_api_keys_tenant FOREIGN KEY (tenant_id) REFERENCES tenants(id) ON DELETE RESTRICT;

ALTER TABLE api_keys ADD CONSTRAINT fk_api_keys_user   FOREIGN KEY (user_id)   REFERENCES users(id)   ON DELETE SET NULL;
