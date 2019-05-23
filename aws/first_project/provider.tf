provider "aws" {
  region = "${var.project_region}"
}

terraform {
  required_version = ">= 0.11.14"

  backend "s3" {
    # The name of the bucket here is not the ID of that bucket in the terraform files, but the real / final bucket name on S3
    bucket  = "mbdebiandevops-myfirstproject-us-east-1"
    key     = "devops/terraform"
    region  = "us-east-1"
    encrypt = "true"
  }
}
