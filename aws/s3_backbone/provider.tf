provider "aws" {
  region = "${var.s3_region}"
}

terraform {
    required_version = ">= 0.11.14"

    backend "s3" {
        bucket = "mbdebians3backbone-test-us-east-1"
        key = "test/prjbackbone"
        region = "us-east-1"
        encrypt = "true"
    }
}
