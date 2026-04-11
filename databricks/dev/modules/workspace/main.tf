terraform {
  required_providers {
    databricks = {
      source            = "databricks/databricks"
      version           = ">= 1.70.0"
      configuration_aliases = [databricks.dbworkspace]
    }
  }
}