provider "aws" {
  region = var.aws_region
}

# ── MWS Provider ──────────────────────────────
# Account level — Unity Catalog, workspace management
provider "databricks" {
  alias         = "mws"
  host          = "https://accounts.cloud.databricks.com"
  client_id     = var.databricks_client_id
  client_secret = var.databricks_client_secret
  account_id    = var.databricks_account_id
}

# ── Workspace Provider ────────────────────────
# Workspace level — notebooks, clusters, external locations
# Phase 1: OAuth M2M (comment out token line, uncomment client_id/secret)
# Phase 2: PAT (current)
provider "databricks" {
  alias     = "dbworkspace"
  host      = var.databricks_host
  token     = var.databricks_token
  auth_type = "pat"
}
