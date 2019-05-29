provider "aws" {
  region = "${var.project_region}"
  version = "2.11.0"
}

provider "template" {
  version = "2.1.2"
}

terraform {
  required_version = ">= 0.11.14"
}
