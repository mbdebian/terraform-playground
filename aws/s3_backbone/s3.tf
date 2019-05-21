resource "aws_s3_bucket" "packtsection2main" {
    bucket = "packt-terraform-section2-bucket"
    acl = "private"
}