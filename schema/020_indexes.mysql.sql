-- Auto-generated from schema-map-mysql.psd1 (map@62c9c93)
-- engine: mysql
-- table:  api_keys
CREATE UNIQUE INDEX ux_api_keys_tenant_name ON api_keys (tenant_id, name_ci);
