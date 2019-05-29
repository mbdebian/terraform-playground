data "aws_ami" "time_machine_ami" {
  most_recent = true

  owners = ["099720109477"]

  filter {
      name = "name"
      values = ["*ubuntu-disco-19.04-amd64-minimal*"]
  }
  filter {
      name = "root-device-type"
      values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_ami" "bastion_ami" {
  most_recent = true

  owners = ["099720109477"]

  filter {
      name = "name"
      values = ["*ubuntu-disco-19.04-amd64-minimal*"]
  }
  filter {
      name = "root-device-type"
      values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
