// Public subnets, each subnet in a different availability zone
// TODO
resource "aws_subnet" "subnet_public" {
  count = "${length(var.platform_availability_zones)}"
  vpc_id = "${aws_vpc.project_vpc.id}"
  cidr_block = "${cidrsubnet(var.vpc_cidr_block, 8, count.index)}"
  availability_zone = "${element(var.platform_availability_zones, count.index)}"
  map_public_ip_on_launch = true

  tags = {
      "name" = "Public subnet - ${element(var.platform_availability_zones, count.index)}"
  }
}

// Private subnets, each subnet in a different availability zone
// TODO