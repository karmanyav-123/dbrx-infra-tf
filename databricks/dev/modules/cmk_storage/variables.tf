variable "env" { type = string }
variable "team" { type = string }
variable "aws_account_id" { type = string }
variable "aws_region" { type = string }

variable "storage_customer_managed_key_arn" {
  type    = string
  default = ""
}

variable "storage_customer_managed_key_alias" {
  type    = string
  default = ""
}
