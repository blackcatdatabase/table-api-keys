-- Auto-generated from schema-map-mysql.yaml (map@sha1:0D716345C0228A9FD8972A3D31574000D05317DB)
-- engine: mysql
-- table:  api_keys

CREATE UNIQUE INDEX ux_api_keys_tenant_name ON api_keys (tenant_id, name_ci);

CREATE UNIQUE INDEX ux_api_keys_tenant_id ON api_keys (tenant_id, id);
