variable "s3_bucket_name" {
    default = "mbdebiantfsection2main"
    description = "Name of the S3 bucket for backbone"
    type = "string"
}

variable "s3_tags" {
    type = "map"

    default = {
        created_by = "Manuel Bernal Llinares"
        email = "mbdebian@gmail.com"
    }
}

variable "s3_regions" {
    type = "list"
    default = ["us-east-1"]
}
