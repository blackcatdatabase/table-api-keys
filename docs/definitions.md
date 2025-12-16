# api_keys

Tenant/user scoped API tokens stored only as hashed secrets.

## Columns
| Column | Type | Null | Default | Description |
| --- | --- | --- | --- | --- |
| id | BIGINT | NO |  | Surrogate primary key. |
| tenant_id | BIGINT | NO |  | Owning tenant (FK tenants.id). |
| user_id | BIGINT | YES |  | User that created the token (FK users.id), optional. |
| name | VARCHAR(120) | NO |  | Human-friendly token label. |
| name_ci | VARCHAR(120) | YES |  | Case-insensitive token label (generated). |
| token_hash | BINARY(32) | NO |  | Hashed token payload. |
| token_hash_key_version | VARCHAR(64) | NO |  | Key version used when hashing the token. |
| scopes | JSON | NO | []'::jsonb | JSON array with granted scopes. |
| status | ENUM('active','revoked','disabled') | NO | active | Lifecycle status flag. (enum: active, revoked, disabled) |
| last_used_at | DATETIME(6) | YES |  | Last usage timestamp (UTC). |
| expires_at | DATETIME(6) | YES |  | Optional expiration timestamp. |
| created_at | DATETIME(6) | NO | CURRENT_TIMESTAMP(6) | Creation timestamp (UTC). |
| updated_at | DATETIME(6) | YES |  | Last update timestamp (UTC). |

## Engine Details

### mysql

Unique keys:
| Name | Columns |
| --- | --- |
| uq_api_keys_token | token_hash |
| ux_api_keys_tenant_id | tenant_id, id |
| ux_api_keys_tenant_name | tenant_id, name_ci |

Indexes:
| Name | Columns | SQL |
| --- | --- | --- |
| idx_api_keys_tenant | tenant_id | INDEX idx_api_keys_tenant (tenant_id) |
| idx_api_keys_user | user_id | INDEX idx_api_keys_user   (user_id) |
| uq_api_keys_token | token_hash | CONSTRAINT uq_api_keys_token UNIQUE (token_hash) |
| ux_api_keys_tenant_id | tenant_id,id | CREATE UNIQUE INDEX ux_api_keys_tenant_id ON api_keys (tenant_id, id) |
| ux_api_keys_tenant_name | tenant_id,name_ci | CREATE UNIQUE INDEX ux_api_keys_tenant_name ON api_keys (tenant_id, name_ci) |

Foreign keys:
| Name | Columns | References | Actions |
| --- | --- | --- | --- |
| fk_api_keys_tenant | tenant_id | tenants(id) | ON DELETE RESTRICT |
| fk_api_keys_user | user_id | users(id) | ON DELETE SET |

### postgres

Unique keys:
| Name | Columns |
| --- | --- |
| uq_api_keys_token | token_hash |
| ux_api_keys_tenant_id | tenant_id, id |
| ux_api_keys_tenant_name | tenant_id, name_ci |

Indexes:
| Name | Columns | SQL |
| --- | --- | --- |
| idx_api_keys_tenant | tenant_id | CREATE INDEX IF NOT EXISTS idx_api_keys_tenant ON api_keys (tenant_id) |
| idx_api_keys_user | user_id | CREATE INDEX IF NOT EXISTS idx_api_keys_user   ON api_keys (user_id) |
| uq_api_keys_token | token_hash | CREATE UNIQUE INDEX IF NOT EXISTS uq_api_keys_token ON api_keys (token_hash) |
| ux_api_keys_tenant_id | tenant_id,id | CREATE UNIQUE INDEX IF NOT EXISTS ux_api_keys_tenant_id ON api_keys (tenant_id, id) |
| ux_api_keys_tenant_name | tenant_id,name_ci | CREATE UNIQUE INDEX IF NOT EXISTS ux_api_keys_tenant_name ON api_keys (tenant_id, name_ci) |

Foreign keys:
| Name | Columns | References | Actions |
| --- | --- | --- | --- |
| fk_api_keys_tenant | tenant_id | tenants(id) | ON DELETE RESTRICT |
| fk_api_keys_user | user_id | users(id) | ON DELETE SET |

## Engine differences

## Views
| View | Engine | Flags | File |
| --- | --- | --- | --- |
| vw_api_keys | mysql | algorithm=MERGE, security=INVOKER | [../schema/040_views.mysql.sql](../schema/040_views.mysql.sql) |
| vw_api_keys | postgres |  | [../schema/040_views.postgres.sql](../schema/040_views.postgres.sql) |
