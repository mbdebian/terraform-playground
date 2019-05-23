// Public subnets, each subnet in a different availability zone
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
resource "aws_subnet" "subnet_private" {
  count = "${length(var.platform_availability_zones)}"
  vpc_id = "${aws_vpc.project_vpc.id}"

  // Take into account CIDR blocks allocated to the public subnets
  cidr_block = "${cidrsubnet(var.vpc_cidr_block, 8, count.index + length(var.platform_availability_zones))}"
  availability_zone = "${element(var.platform_availability_zones, count.index)}"
  map_public_ip_on_launch = false

  tags {
      "name" = "Private subnet - ${element(var.platform_availability_zones, count.index)}"
  }
}

// NAT gateways, enable instances in a private subnet to connect to the Internet or other AWS services,
// but prevent the internet from initiating a connection with those instances.
// We create a separate NAT gateway in each AZ for high availability.
// Each NAT gateway requires an Elastic IP
resource "aws_eip" "subnet_nat" {
  count = "${length(var.platform_availability_zones)}"
  vpc = true
}

resource "aws_nat_gateway" "subnet_nat_gateway" {
  count = "${length(var.platform_availability_zones)}"
  subnet_id = "${element(aws_subnet.subnet_private.*.id, count.index)}"
  allocation_id = "${element(aws_eip.subnet_nat.*.id, count.index)}"

  tags {
      "name" = "NAT - ${element(var.platform_availability_zones, count.index)}"
  }
}

