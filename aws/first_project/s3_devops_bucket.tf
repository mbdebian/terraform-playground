resource "aws_s3_bucket" "s3bucketdevopsterraform" {
  bucket = "${var.s3_devops_prefix}-${var.s3_region}"
  acl    = "private"
  tags = "${local.s3_bucket_devops_tags}"
  region = "${var.project_region}"

  lifecycle {
      prevent_destroy = "true"
  }

  server_side_encryption_configuration {
      rule {
          apply_server_side_encryption_by_default {
              sse_algorithm = "AES256"
          }
      }
  }

  versioning {
      enabled = true
  }

  lifecycle_rule {
      id = "state"
      prefix = "state/"
      enabled = true

      noncurrent_version_expiration {
          days = 90
      }
  }
}