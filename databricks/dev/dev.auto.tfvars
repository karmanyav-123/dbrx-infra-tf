# ─────────────────────────────────────────────
# AWS
# ─────────────────────────────────────────────
aws_region     = "us-east-2"
aws_account_id = "219366469144"

# ─────────────────────────────────────────────
# Databricks
# ─────────────────────────────────────────────
databricks_host         = "https://dbc-eba3b5c1-b94d.cloud.databricks.com"
databricks_workspace_id = "7474660166312859" 
databricks_account_id   = "f5625652-0e9f-4b02-bee8-4210c80918d4" 

# Sensitive — set via Terraform Cloud variables:
# databricks_token
# databricks_client_id
# databricks_client_secret

# ─────────────────────────────────────────────
# Project
# ─────────────────────────────────────────────
env          = "dev"
team         = "kv"
project      = "fhir-poc"
catalog_name = "KVDev"
sp_roles_list = ["sp-kv-etl-app-dev"]

# ─────────────────────────────────────────────
# S3 Buckets
# ─────────────────────────────────────────────
catalog_bucket    = "s3://kv-dev-219366469144-catalog"
ingestion_bucket  = "s3://kv-dev-219366469144-ingestion"
databricks_bucket = "s3://kv-dev-219366469144-databricks"

# ─────────────────────────────────────────────
# IAM
# ─────────────────────────────────────────────
catalog_role_arn     = "arn:aws:iam::219366469144:role/kv-dev-catalog-role"
# instance_profile_arn = "arn:aws:iam::219366469144:instance-profile/kv-dev-instance-profile"

# ─────────────────────────────────────────────
# KMS
# ─────────────────────────────────────────────
storage_customer_managed_key_arn   = "arn:aws:kms:us-east-2:219366469144:key/52fb1ead-518b-44a0-8352-c4992ed31f5c"
storage_customer_managed_key_alias = "kms-key/databricks/dev/us-east-2/kv"
