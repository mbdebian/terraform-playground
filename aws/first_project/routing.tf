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


