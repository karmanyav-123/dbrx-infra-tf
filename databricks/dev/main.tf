terraform {
  cloud {
    organization = "KV-DataEngg-Project"
    workspaces {
      name = "kv-dev-databricks"
    }
  }
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

data "aws_caller_identity" "current" {}
