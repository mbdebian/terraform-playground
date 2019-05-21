variable "environment" {
  type    = "string"
  default = "test"
}

variable "s3_bucket_prefix" {
  description = "Prefix of the S3 bucket for backbone"
  type        = "string"
}

variable "s3_region" {
  type = "string"
}

locals {
  s3_tags = {
    created_by  = "Manuel Bernal Llinares"
    email       = "mbdebian@gmail.com"
    environment = "${var.environment}"
  }
}
