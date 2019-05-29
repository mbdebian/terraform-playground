// In this first iteration, all services will be deployed on a single availability zone
// Prepare the private subnets
resource "aws_subnet" "private" {
  count = "${length(var.services_availability_zones)}"
  vpc_id = "${aws_vpc.home_services_vpc.id}"
  cidr_block = "${cidrsubnet(var.vpc_cidr_block, 8, count.index)}"
  availability_zone = "${element(var.services_availability_zones, count.index)}"
  map_public_ip_on_launch = false

  tags {
      "name" = "${var.project_name} - SUBNET (Private) - ${element(var.services_availability_zones, count.index)}"
  }
}
