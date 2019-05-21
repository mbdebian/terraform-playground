resource "aws_s3_bucket" "mbdebiantfsection2main" {
    bucket = "${var.s3_bucket_name}"
    acl = "private"

    tags = {
        created_by = "${lookup(var.s3_tags, "created_by")}"
    }

    region = "${var.s3_regions[0]}"
}