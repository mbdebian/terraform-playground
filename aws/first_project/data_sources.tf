// Public key for bastion instances
data "template_file" "bastion_public_key" {
  template_file = "${file("~/.ssh/sandman_rsa.pub")}"
}

// AWS
