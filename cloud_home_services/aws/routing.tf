// Routing tables within the infrastructure
// Private Routes
// From each availability zone to its NAT Gateway
resource "aws_route_table" "private" {
  count = "${length(var.services_availability_zones)}"
  vpc_id = "${aws_vpc.home_services_vpc.id}"
  tags {
      "name" = "${var.project_name} - ROUTING Table (Private) - ${element(var.services_availability_zones, count.index)}"
  }
}
