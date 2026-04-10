# ─────────────────────────────────────────────
# workspace.tf
# Phase 1: Only workspace + cmk_storage modules
# Phase 2: Add sqlwarehouses + grants
# ─────────────────────────────────────────────

module "workspace" {
  source = "./modules/workspace"

  providers = {
    databricks = databricks.dbworkspace
  }

  env                     = var.env
  team                    = var.team
  project                 = var.project
  catalog_name            = var.catalog_name
  sp_roles_list           = var.sp_roles_list
  catalog_bucket          = var.catalog_bucket
  ingestion_bucket        = var.ingestion_bucket
  databricks_bucket       = var.databricks_bucket
  catalog_role_arn        = var.catalog_role_arn
}

module "cmk_storage" {
  source = "./modules/cmk_storage"

  providers = {
    databricks = databricks.mws
  }

  env                                = var.env
  team                               = var.team
  aws_account_id                     = var.aws_account_id
  aws_region                         = var.aws_region
  storage_customer_managed_key_arn   = var.storage_customer_managed_key_arn
  storage_customer_managed_key_alias = var.storage_customer_managed_key_alias

  depends_on = [module.workspace]
}

# ── Phase 2 — uncomment when workspace is ready ──
# module "sqlwarehouses" {
#   source = "./modules/sqlwarehouses"
#   providers = {
#     databricks = databricks.dbworkspace
#   }
#   env     = var.env
#   team    = var.team
#   project = var.project
#   depends_on = [module.workspace]
# }

# module "grants" {
#   source = "./modules/grants"
#   providers = {
#     databricks = databricks.dbworkspace
#   }
#   env          = var.env
#   team         = var.team
#   catalog_name = module.workspace.catalog_name
#   depends_on   = [module.workspace]
# }
