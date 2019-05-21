resource "aws_s3_bucket" "mbdebiantfmain" {
    bucket = "packt-terraform-section2-bucket"
    acl = "private"
}