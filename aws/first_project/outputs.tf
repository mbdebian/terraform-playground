output "vpc_id" {
  value = "${aws_vpc.project_vpc.id}"
}

output "public_subnets" {
  value = "${aws_subnet.subnet_public.*.id}"
}
