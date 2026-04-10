# ─────────────────────────────────────────────
# CMK Storage
# Registers existing AWS KMS key with Databricks MWS
# KMS key AWS CDK/Console se bana hua hai
# NOTE: Requires Databricks Premium/E2
# ─────────────────────────────────────────────

resource "databricks_mws_customer_managed_keys" "storage" {
  provider   = databricks.mws
  account_id = var.aws_account_id

  aws_key_info {
    key_arn   = var.storage_customer_managed_key_arn
    key_alias = var.storage_customer_managed_key_alias
  }

  use_cases = ["STORAGE"]
}