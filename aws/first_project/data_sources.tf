// Public key for bastion instances
data "template_file" "bastion_public_key" {
  template = "${file("~/.ssh/bofh_aws_terraform.pub")}"
}

// AWS
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn-ami-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }
}
