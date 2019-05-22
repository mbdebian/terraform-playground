resource "aws_vpc" "project_vpc" {
  cidr_block = "${var.vpc_cidr_block}"

  tags = {
      "name" = "Project VPC"
  }
}

// Enable access to / from internet for the instances in the public subnets
resource "aws_internet_gateway" "platform_public_gateway" {
  vpc_id = "${aws_vpc.project_vpc.id}"

  tags {
    "name" = "Platform Public Gateway"
  }
}

