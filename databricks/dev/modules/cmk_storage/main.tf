terraform {
  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = ">= 1.70.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
