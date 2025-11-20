-- Auto-generated from schema-map-mysql.psd1 (map@62c9c93)
-- engine: mysql
-- table:  api_keys
ALTER TABLE api_keys ADD CONSTRAINT fk_api_keys_user   FOREIGN KEY (user_id)   REFERENCES users(id) ON DELETE SET NULL;

ALTER TABLE api_keys ADD CONSTRAINT fk_api_keys_tenant FOREIGN KEY (tenant_id) REFERENCES tenants(id) ON DELETE RESTRICT;
