-- Auto-generated from schema-map-postgres.psd1 (map@62c9c93)
-- engine: postgres
-- table:  api_keys
ALTER TABLE api_keys ADD CONSTRAINT fk_api_keys_tenant FOREIGN KEY (tenant_id) REFERENCES tenants(id);

ALTER TABLE api_keys ADD CONSTRAINT fk_api_keys_user   FOREIGN KEY (user_id)   REFERENCES users(id);
