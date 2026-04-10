output "catalog_name" {
  value = databricks_catalog.catalog.name
}

output "storage_credential_name" {
  value = databricks_storage_credential.storage_credential.name
}
