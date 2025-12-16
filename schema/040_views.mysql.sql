-- Auto-generated from schema-views-mysql.yaml (map@sha1:FFA9A9D6FA9EE079B0DAEBB6FEE023C138E8FFA1)
-- engine: mysql
-- table:  api_keys

-- Contract view for [api_keys]
-- Hides token_hash; exposes hex and activity helpers.
CREATE OR REPLACE ALGORITHM=MERGE SQL SECURITY INVOKER VIEW vw_api_keys AS
SELECT
  id,
  tenant_id,
  user_id,
  name,
  token_hash_key_version,
  token_hash,
  UPPER(HEX(token_hash)) AS token_hash_hex,
  scopes,
  status,
  last_used_at,
  expires_at,
  created_at,
  updated_at,
  (status = 'active' AND (expires_at IS NULL OR expires_at > NOW())) AS is_active
FROM api_keys;
