<!-- Auto-generated from schema-map-postgres.psd1 @ 62c9c93 (2025-11-20T21:38:11+01:00) -->
# Definition – api_keys

Tenant/user scoped API tokens stored only as hashed secrets.

## Columns
| Column | Type | Null | Default | Description | Notes |
|-------:|:-----|:----:|:--------|:------------|:------|
| id | BIGSERIAL | — | — | Surrogate primary key. |  |
| tenant_id | BIGINT | NO | — | Owning tenant (FK tenants.id). |  |
| user_id | BIGINT | YES | — | User that created the token (FK users.id), optional. |  |
| name | VARCHAR(120) | NO | — | Human-friendly token label. |  |
| name_ci | TEXT | — | — |  |  |
| token_hash | BYTEA | NO | — | Hashed token payload. | PII: hashed |
| token_hash_key_version | VARCHAR(64) | NO | — | Key version used when hashing the token. |  |
| scopes | JSONB | NO | '[]' | JSON array with granted scopes. |  |
| status | VARCHAR(20) | NO | 'active' | Lifecycle status flag. | enum: active, revoked, disabled |
| last_used_at | TIMESTAMPTZ(6) | YES | — | Last usage timestamp (UTC). |  |
| expires_at | TIMESTAMPTZ(6) | YES | — | Optional expiration timestamp. |  |
| created_at | TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Creation timestamp (UTC). |  |
| updated_at | TIMESTAMPTZ(6) | YES | — | Last update timestamp (UTC). |  |