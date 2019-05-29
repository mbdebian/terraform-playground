resource "aws_vpc" "home_services_vpc" {
  cidr_block = "${var.vpc_cidr_block}"

  tags = {
    "name" = "${var.project_name} - VPC"
  }
}
