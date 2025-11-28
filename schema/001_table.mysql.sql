-- Auto-generated from schema-map-mysql.psd1 (map@mtime:2025-11-27T15:13:14Z)
-- engine: mysql
-- table:  api_keys

CREATE TABLE IF NOT EXISTS api_keys (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  tenant_id BIGINT UNSIGNED NOT NULL,
  user_id BIGINT UNSIGNED NULL,
  name VARCHAR(120) NOT NULL,
  name_ci VARCHAR(120) GENERATED ALWAYS AS (LOWER(name)) STORED,
  token_hash BINARY(32) NOT NULL,
  token_hash_key_version VARCHAR(64) NOT NULL,
  scopes JSON NOT NULL,
  status ENUM('active','revoked','disabled') NOT NULL DEFAULT 'active',
  last_used_at DATETIME(6) NULL,
  expires_at DATETIME(6) NULL,
  created_at DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  updated_at DATETIME(6) NULL,
  CONSTRAINT uq_api_keys_token UNIQUE (token_hash),
  INDEX idx_api_keys_tenant (tenant_id),
  INDEX idx_api_keys_user   (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
