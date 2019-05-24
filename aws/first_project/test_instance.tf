// This file defines the test instance
resource "aws_launch_configuration" "test" {
  // Launch configurations cannot be updated after creation with the AWS AMI,
  // In order to update a launch configuration, terraform will destroy the existing
  // resource, and create a replacement
  // We're only setting the name prefix here, terraform will add a random string at
  // the end to keep it unique
  name_prefix = "test-"
  image_id = "${data.aws_ami.amazon_linux.id}"
  instance_type = "${var.platform_bastion_instance_type}"
  key_name = "${aws_key_pair.bastion.key_name}"
  associate_public_ip_address = false
  enable_monitoring = false
  security_groups = ["${aws_security_group.test.id}"]

  lifecycle {
      create_before_destroy = true
  }
}
