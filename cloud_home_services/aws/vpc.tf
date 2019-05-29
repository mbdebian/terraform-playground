resource "aws_vpc" "home_services_vpc" {
  cidr_block = "${var.vpc_cidr_block}"

  tags = {
    "name" = "${var.project_name} - VPC"
  }
}

// Enable access to / from internet for the instances in the public subnets
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = "${aws_vpc.project_vpc.id}"

  tags {
    "name" = "${var.project_name} - Internet Gateway"
  }
}
