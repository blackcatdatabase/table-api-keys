# 📦 Api Keys

![SQL](https://img.shields.io/badge/SQL-MySQL%208.0%2B-4479A1?logo=mysql&logoColor=white) ![License](https://img.shields.io/badge/license-BlackCat%20Proprietary-red) ![Status](https://img.shields.io/badge/status-stable-informational) ![Generated](https://img.shields.io/badge/generated-from%20schema--map-blue)

<!-- Auto-generated from schema-map-postgres.psd1 @ 62c9c93 (2025-11-20T21:38:11+01:00) -->

> Schema package for table **api_keys** (repo: `api-keys`).

## Files
```
schema/
  001_table.sql
  020_indexes.sql
  030_foreign_keys.sql
```

## Quick apply
```bash
# Apply schema (Linux/macOS):
mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" < schema/001_table.sql
mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" < schema/020_indexes.sql
mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" < schema/030_foreign_keys.sql
```

```powershell
# Apply schema (Windows PowerShell):
mysql -h $env:DB_HOST -u $env:DB_USER -p$env:DB_PASS $env:DB_NAME < schema/001_table.sql
mysql -h $env:DB_HOST -u $env:DB_USER -p$env:DB_PASS $env:DB_NAME < schema/020_indexes.sql
mysql -h $env:DB_HOST -u $env:DB_USER -p$env:DB_PASS $env:DB_NAME < schema/030_foreign_keys.sql
```

## Docker quickstart
```bash
# Spin up a throwaway MySQL and apply just this package:
docker run --rm -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=app -p 3307:3306 -d mysql:8
sleep 15
mysql -h 127.0.0.1 -P 3307 -u root -proot app < schema/001_table.sql
mysql -h 127.0.0.1 -P 3307 -u root -proot app < schema/020_indexes.sql
mysql -h 127.0.0.1 -P 3307 -u root -proot app < schema/030_foreign_keys.sql
```

## Columns
| Column | Type | Null | Default | Extra |
|-------:|:-----|:----:|:--------|:------|
| id | BIGSERIAL | — | — | PK |
| tenant_id | BIGINT | NO | — |  |
| user_id | BIGINT | YES | — |  |
| name | VARCHAR(120) | NO | — |  |
| name_ci | TEXT | — | — |  |
| token_hash | BYTEA | NO | — |  |
| token_hash_key_version | VARCHAR(64) | NO | — |  |
| scopes | JSONB | NO | '[]' |  |
| status | VARCHAR(20) | NO | 'active' |  |
| last_used_at | TIMESTAMPTZ(6) | YES | — |  |
| expires_at | TIMESTAMPTZ(6) | YES | — |  |
| created_at | TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) |  |
| updated_at | TIMESTAMPTZ(6) | YES | — |  |

## Relationships
- FK → **tenants** via (tenant_id) (ON DELETE —).
- FK → **users** via (user_id) (ON DELETE —).

```mermaid
erDiagram
  API_KEYS {
    BIGSERIAL id PK
    INT tenant_id
    INT user_id
    VARCHAR name
    VARCHAR name_ci
    BYTEA token_hash
    VARCHAR token_hash_key_version
    JSONB scopes
    VARCHAR status
    TIMESTAMPTZ last_used_at
    TIMESTAMPTZ expires_at
    TIMESTAMPTZ created_at
    TIMESTAMPTZ updated_at
  }
  API_KEYS }o--|| TENANTS : "tenant_id"
  API_KEYS }o--|| USERS : "user_id"
```

## Indexes
- 4 deferred index statement(s) in schema/020_indexes.sql.

## Notes
- Generated from the umbrella repository **blackcat-database** using `scripts/schema-map.psd1`.
- To change the schema, update the map and re-run the generators.

## License
Distributed under the **BlackCat Store Proprietary License v1.0**. See `LICENSE`.
