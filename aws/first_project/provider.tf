provider "aws" {
  region = "${var.s3_region}"
}

terraform {
    required_version = ">= 0.11.14"

    backend "s3" {
        bucket = "mbdebiandevops-myfirst-project-us-east-1"
        key = "devops/terraform"
        region = "us-east-1"
        encrypt = "true"
    }
}
