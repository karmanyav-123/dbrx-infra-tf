# ─────────────────────────────────────────────
# Storage Credential
# ─────────────────────────────────────────────
resource "databricks_storage_credential" "storage_credential" {
  provider = databricks.dbworkspace
  name     = "${var.team}-${var.env}-storage-credential"

  aws_iam_role {
    role_arn = var.catalog_role_arn
  }

  comment = "Storage credential for ${var.team} ${var.env}"
}

resource "databricks_grants" "storage_credential_grant" {
  provider           = databricks.dbworkspace
  storage_credential = databricks_storage_credential.storage_credential.id

  grant {
    principal  = "account users"
    privileges = ["ALL PRIVILEGES"]
  }
}

# ─────────────────────────────────────────────
# External Locations
# ─────────────────────────────────────────────
resource "databricks_external_location" "catalog_external_location" {
  provider        = databricks.dbworkspace
  name            = "${var.team}-${var.env}-catalog"
  url             = "${var.catalog_bucket}"
  credential_name = databricks_storage_credential.storage_credential.id
  comment         = "Catalog data bucket"
}

resource "databricks_catalog" "catalog" {
  provider                        = databricks.dbworkspace
  name                            = var.catalog_name
  comment                         = "${var.team} ${var.env} catalog"
  storage_root                    = var.catalog_bucket
  enable_predictive_optimization  = "DISABLE"
  isolation_mode                  = "ISOLATED"

  properties = {
    purpose = "${var.team}-${var.env}"
  }

  depends_on = [databricks_external_location.catalog_external_location]
}

resource "databricks_grants" "catalog_grant" {
  provider = databricks.dbworkspace
  catalog  = databricks_catalog.catalog.name

  grant {
    principal = "account users"
    privileges = [
      "CREATE_FUNCTION",
      "CREATE_MATERIALIZED_VIEW",
      "CREATE_MODEL",
      "CREATE_SCHEMA",
      "CREATE_TABLE",
      "CREATE_VOLUME",
      "READ_VOLUME",
      "USE_CATALOG",
      "USE_SCHEMA",
      "WRITE_VOLUME",
    ]
  }

  dynamic "grant" {
    for_each = var.sp_roles_list
    content {
      principal  = grant.value
      privileges = ["MANAGE"]
    }
  }

  depends_on = [databricks_catalog.catalog]
}

resource "databricks_external_location" "ingestion_external_location" {
  provider        = databricks.dbworkspace
  name            = "${var.team}-${var.env}-ingestion"
  url             = "${var.ingestion_bucket}"
  credential_name = databricks_storage_credential.storage_credential.id
  comment         = "Raw ingestion data bucket"

  depends_on = [databricks_storage_credential.storage_credential]
}

resource "databricks_grants" "ingestion_grants" {
  provider          = databricks.dbworkspace
  external_location = databricks_external_location.ingestion_external_location.name

  grant {
    principal  = "account users"
    privileges = ["ALL PRIVILEGES"]
  }
}

resource "databricks_external_location" "root_bucket" {
  provider        = databricks.dbworkspace
  name            = "${var.team}-${var.env}-root"
  url             = "${var.databricks_bucket}"
  credential_name = databricks_storage_credential.storage_credential.id
  comment         = "Databricks workspace storage bucket"

  depends_on = [databricks_storage_credential.storage_credential]
}

resource "databricks_grants" "root_bucket_grants" {
  provider          = databricks.dbworkspace
  external_location = databricks_external_location.root_bucket.name

  grant {
    principal  = "account users"
    privileges = ["ALL PRIVILEGES"]
  }
}

resource "databricks_external_location" "dcv_bucket" {
  provider        = databricks.dbworkspace
  name            = "${var.team}-${var.env}-dcv"
  url             = "${var.dcv_bucket}"
  credential_name = databricks_storage_credential.storage_credential.id
  comment         = "DCV bucket"

  depends_on = [databricks_storage_credential.storage_credential]
}

resource "databricks_grants" "dcv_bucket_grants" {
  provider          = databricks.dbworkspace
  external_location = databricks_external_location.dcv_bucket.name

  grant {
    principal  = "account users"
    privileges = ["ALL PRIVILEGES"]
  }
}

resource "databricks_external_location" "atomic_bucket" {
  provider        = databricks.dbworkspace
  name            = "${var.team}-${var.env}-atomic"
  url             = "${var.atomic_bucket}"
  credential_name = databricks_storage_credential.storage_credential.id
  comment         = "Databricks workspace storage bucket"

  depends_on = [databricks_storage_credential.storage_credential]
}

resource "databricks_grants" "atomic_bucket_grants" {
  provider          = databricks.dbworkspace
  external_location = databricks_external_location.atomic_bucket.name

  grant {
    principal  = "account users"
    privileges = ["ALL PRIVILEGES"]
  }
}