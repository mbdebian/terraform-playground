// A Bastion host for testing purposes
resource "aws_key_pair" "bastion" {
  key_name = "bastion-authkey"
  public_key = "${data.template_file.bofh_management_key.rendered}"
}

