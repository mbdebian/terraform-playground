variable "environment" {
    type = "string"
    default = "test"
}


variable "s3_bucket_name" {
    default = "mbdebiantfsection2main"
    description = "Name of the S3 bucket for backbone"
    type = "string"
}

variable "s3_regions" {
    type = "list"
    default = ["us-east-1", "us-east-2"]
}

locals {
  s3_tags = {
        created_by = "Manuel Bernal Llinares"
        email = "mbdebian@gmail.com"
        environment = "${var.environment}"
    }
}
