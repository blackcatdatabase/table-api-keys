-- Auto-generated from schema-map-mysql.yaml (map@sha1:5E62933580349BE7C623D119AC9D1301A62F03EF)
-- engine: mysql
-- table:  api_keys

CREATE UNIQUE INDEX ux_api_keys_tenant_name ON api_keys (tenant_id, name_ci);

CREATE UNIQUE INDEX ux_api_keys_tenant_id ON api_keys (tenant_id, id);
