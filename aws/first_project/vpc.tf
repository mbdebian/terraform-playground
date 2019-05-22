resource "aws_vpc" "project_vpc" {
  cidr_block = "${var.vpc_cidr_block}"

  tags = {
      "name" = "Project VPC"
  }
}

// 
