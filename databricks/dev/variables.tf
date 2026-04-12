variable "aws_region" {
  type    = string
  default = "us-east-2"
}

variable "aws_account_id" {
  type = string
}

variable "databricks_host" {
  type = string
}

variable "databricks_token" {
  type      = string
  sensitive = true
}

variable "databricks_client_id" {
  type      = string
  sensitive = true
}

variable "databricks_client_secret" {
  type      = string
  sensitive = true
}

variable "databricks_account_id" {
  type = string
}

variable "databricks_workspace_id" {
  type = string
}

variable "env" {
  type    = string
  default = "dev"
}

variable "team" {
  type    = string
  default = "kv"
}

variable "project" {
  type    = string
  default = "fhir-poc"
}

variable "catalog_name" {
  type = string
}

variable "sp_roles_list" {
  type    = list(string)
  default = []
}

variable "catalog_bucket" {
  type = string
}

variable "ingestion_bucket" {
  type = string
}

variable "databricks_bucket" {
  type = string
}

variable "catalog_role_arn" {
  type = string
}

variable "storage_customer_managed_key_arn" {
  type    = string
  default = ""
}

variable "storage_customer_managed_key_alias" {
  type    = string
  default = ""
}

variable "dcv_bucket" {
  type = string
}

variable "atomic_bucket" {
  type = string
}