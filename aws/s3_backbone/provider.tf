provider "aws" {
  region = "${var.s3_region}"
}

terraform {
    required_version = ">= 0.11.14"
}
