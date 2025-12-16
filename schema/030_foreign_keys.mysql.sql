-- Auto-generated from schema-map-mysql.yaml (map@sha1:B9D3BE28A74392B9B389FDAFB493BD80FA1F6FA4)
-- engine: mysql
-- table:  api_keys

ALTER TABLE api_keys ADD CONSTRAINT fk_api_keys_user   FOREIGN KEY (user_id)   REFERENCES users(id) ON DELETE SET NULL;

ALTER TABLE api_keys ADD CONSTRAINT fk_api_keys_tenant FOREIGN KEY (tenant_id) REFERENCES tenants(id) ON DELETE RESTRICT;
