# api_keys

Tenant/user scoped API tokens stored only as hashed secrets.

## Columns
| Column | Type | Null | Default | Description |
| --- | --- | --- | --- | --- |
| created_at |  | NO | CURRENT_TIMESTAMP(6) | Creation timestamp (UTC). |
| expires_at |  | YES |  | Optional expiration timestamp. |
| id |  | NO |  | Surrogate primary key. |
| last_used_at |  | YES |  | Last usage timestamp (UTC). |
| name |  | NO |  | Human-friendly token label. |
| name_ci |  | YES |  | Case-insensitive token label (generated). |
| scopes |  | NO | []'::jsonb | JSON array with granted scopes. |
| status |  | NO | active | Lifecycle status flag. (enum: active, revoked, disabled) |
| tenant_id |  | NO |  | Owning tenant (FK tenants.id). |
| token_hash |  | NO |  | Hashed token payload. |
| token_hash_key_version | VARCHAR(64) | NO |  | Key version used when hashing the token. |
| updated_at |  | YES |  | Last update timestamp (UTC). |
| user_id |  | YES |  | User that created the token (FK users.id), optional. |

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
| vw_api_keys | mysql | algorithm=MERGE, security=INVOKER | [packages\api-keys\schema\040_views.mysql.sql](https://github.com/blackcatacademy/blackcat-database/packages/api-keys/schema/040_views.mysql.sql) |
| vw_api_keys | postgres |  | [packages\api-keys\schema\040_views.postgres.sql](https://github.com/blackcatacademy/blackcat-database/packages/api-keys/schema/040_views.postgres.sql) |
