// A Bastion host for testing purposes
resource "aws_key_pair" "bastion" {
  key_name = "bastion-authkey"
  public_key = "${data.template_file.bofh_management_key.rendered}"
}

resource "aws_launch_configuration" "bastion" {
  name = "bastion"
  name_prefix = "bastion-"
  image_id = "${data.aws_ami.bastion_ami.id}"
  instance_type = "${var.service_time_machine_instance_type}"
  
}
