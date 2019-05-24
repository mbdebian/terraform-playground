// Instance definition
resource "aws_launch_configuration" "test" {
  // Launch configurations cannot be updated after creation with the AWS AMI,
  // In order to update a launch configuration, terraform will destroy the existing
  // resource, and create a replacement
  // We're only setting the name prefix here, terraform will add a random string at
  // the end to keep it unique
  name_prefix = "test-"

  image_id                    = "${data.aws_ami.amazon_linux.id}"
  instance_type               = "${var.platform_bastion_instance_type}"
  key_name                    = "${aws_key_pair.bastion.key_name}"
  associate_public_ip_address = false
  enable_monitoring           = false
  security_groups             = ["${aws_security_group.test.id}"]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "test" {
  name                 = "${aws_launch_configuration.test.name}-asg"
  min_size             = 0
  desired_capacity     = 0
  max_size             = 1
  health_check_type    = "EC2"
  launch_configuration = "${aws_launch_configuration.test.name}"
  vpc_zone_identifier  = ["${aws_subnet.subnet_private.*.id}"]

  tags = [
    {
      key                 = "name"
      value               = "test"
      propagate_at_launch = true
    },
  ]
}

// Security
resource "aws_security_group" "test" {
  name_prefix = "Test SG"
  description = "Security group for the test host"
  vpc_id      = "${aws_vpc.project_vpc.id}"

  lifecycle {
    create_before_destroy = true
  }
}

// Security rules
resource "aws_security_group_rule" "test_allow_all_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.test.id}"
}

resource "aws_security_group_rule" "test_allow_all_outbound" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.test.id}"
}
