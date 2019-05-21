resource "aws_s3_bucket" "mbdebiantfsection2main" {
    bucket = "${var.s3_bucket_name}"
    acl = "private"

    tags = "${local.s3_tags}"

    region = "${var.s3_regions[0]}"
}