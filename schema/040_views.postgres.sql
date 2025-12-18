-- Auto-generated from schema-views-postgres.yaml (map@sha1:3C365C10BD489376A27944AE10F143E1BE4D3BCF)
-- engine: postgres
-- table:  api_keys

-- Contract view for [api_keys]
-- (gap fix) Hides token_hash; exposes hex and activity helpers.
CREATE OR REPLACE VIEW vw_api_keys AS
SELECT
  id,
  tenant_id,
  user_id,
  name,
  name_ci,
  token_hash_key_version,
  token_hash,
  UPPER(encode(token_hash,'hex')) AS token_hash_hex,
  scopes,
  status,
  last_used_at,
  expires_at,
  created_at,
  updated_at,
  (status = 'active' AND (expires_at IS NULL OR expires_at > now())) AS is_active
FROM api_keys;
