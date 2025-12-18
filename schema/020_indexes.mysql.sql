-- Auto-generated from schema-map-mysql.yaml (map@sha1:7AAC4013A2623AC60C658C9BF8458EFE0C7AB741)
-- engine: mysql
-- table:  api_keys

CREATE UNIQUE INDEX ux_api_keys_tenant_name ON api_keys (tenant_id, name_ci);

CREATE UNIQUE INDEX ux_api_keys_tenant_id ON api_keys (tenant_id, id);
