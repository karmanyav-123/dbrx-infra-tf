variable "env" { type = string }
variable "team" { type = string }
variable "project" { type = string }
variable "catalog_name" { type = string }
variable "catalog_bucket" { type = string }
variable "ingestion_bucket" { type = string }
variable "databricks_bucket" { type = string }
variable "catalog_role_arn" { type = string }
variable "sp_roles_list" {
  type    = list(string)
  default = []
}
