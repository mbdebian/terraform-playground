output "vpc_id" {
  value = "${aws_vpc.project_vpc.id}"
}

output "public_subnets" {
  value = "${aws_subnet.subnet_public.*.id}"
}

output "public_cidrs" {
  value = "${aws_subnet.subnet_public.*.cidr_block}"
}

output "private_subnets" {
  value = "${aws_subnet.subnet_private.*.id}"
}
