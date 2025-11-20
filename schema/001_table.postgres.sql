-- Auto-generated from schema-map-postgres.psd1 (map@62c9c93)
-- engine: postgres
-- table:  api_keys
CREATE TABLE IF NOT EXISTS api_keys (
  id               BIGSERIAL PRIMARY KEY,
  tenant_id        BIGINT NOT NULL,
  user_id          BIGINT NULL,
  name             VARCHAR(120) NOT NULL,
  name_ci          TEXT GENERATED ALWAYS AS (lower(name)) STORED,
  token_hash       BYTEA NOT NULL,
  token_hash_key_version VARCHAR(64) NOT NULL,
  scopes           JSONB NOT NULL DEFAULT '[]'::jsonb,
  status           VARCHAR(20) NOT NULL DEFAULT 'active',
  last_used_at     TIMESTAMPTZ(6) NULL,
  expires_at       TIMESTAMPTZ(6) NULL,
  created_at       TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  updated_at       TIMESTAMPTZ(6) NULL,
  CONSTRAINT chk_api_keys_status CHECK (status IN ('active','revoked','disabled'))
);
