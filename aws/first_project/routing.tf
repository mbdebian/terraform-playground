// Route the public subnet traffic through the Internet Gateway
resource "aws_route_table" "route_table_public" {
  vpc_id = "${aws_vpc.project_vpc.id}"

  tags = {
      "name" = "Public route table"
  }
}

resource "aws_route" "public_internet_gateway" {
  route_table_id = "${aws_route_table.route_table_public.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = "${aws_internet_gateway.platform_public_gateway}"
}

resource "aws_route_table_association" "public" {
  count = "${length(var.platform_availability_zones)}"

  subnet_id = "${element(aws_subnet.subnet_public.*.id, count.index)}"
  route_table_id = "${aws_route_table.route_table_public.id}"
}

// Now we create the routing table for the private subnets
// Route non-local traffic through the NAT gateway to the Internet
resource "aws_route_table" "route_table_private" {
  vpc_id = "${aws_vpc.project_vpc.id}"

  tags = {
      "name" = "Private subnets routing table"
  }
}

