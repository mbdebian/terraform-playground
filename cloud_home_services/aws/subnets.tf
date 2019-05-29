// In this first iteration, all services will be deployed on a single availability zone
// Prepare the public subnets (otherwise, NAT Gateways don't work)
resource "aws_subnet" "public" {
  count = "${length(var.services_availability_zones)}"
  vpc_id = "${aws_vpc.home_services_vpc.id}"
  cidr_block = "${cidrsubnet(var.vpc_cidr_block, 8, count.index)}"
  availability_zone = "${element(var.services_availability_zones, count.index)}"
  map_public_ip_on_launch = true

  tags {
      "name" = "${var.project_name} - SUBNET (Public) - ${element(var.services_availability_zones, count.index)}"
  }
}

// Prepare the private subnets
resource "aws_subnet" "private" {
  count = "${length(var.services_availability_zones)}"
  vpc_id = "${aws_vpc.home_services_vpc.id}"
  // Take into account we already allocated 'n' subnets for the public block
  cidr_block = "${cidrsubnet(var.vpc_cidr_block, 8, count.index + length(var.services_availability_zones))}"
  availability_zone = "${element(var.services_availability_zones, count.index)}"
  // Default is no public IP on launch
  //map_public_ip_on_launch = false

  tags {
      "name" = "${var.project_name} - SUBNET (Private) - ${element(var.services_availability_zones, count.index)}"
  }
}

// Reserve the Elastic IPs
resource "aws_eip" "eipnat" {
  count = "${length(var.services_availability_zones)}"
  vpc = true
}

// Create a NAT gateway per zone
resource "aws_nat_gateway" "nat_gateway" {
  count = "${length(var.services_availability_zones)}"
  subnet_id = "${element(aws_subnet.public.*.id, count.index)}"
  allocation_id = "${element(aws_eip.eipnat.*.id, count.index)}"
  tags {
      "name" = "${var.project_name} - NAT Gateway - ${element(var.services_availability_zones, count.index)}"
  }
}
