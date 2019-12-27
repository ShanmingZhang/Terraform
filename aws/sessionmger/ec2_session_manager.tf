
resource "aws_instance" "iac_smger_instance" {
  ami           = "ami-408c7f28"
  instance_type = "t1.micro"

  iam_instance_profile = aws_iam_instance_profile.iac_smger_instance_profile.name

  network_interface {
    network_interface_id = aws_network_interface.iac_smger_if.id
    device_index         = 0
  }

  tags = {
    Name = "iac_smger_instance"
  }

}

