resource "aws_instance" "iac_ec2_instance" {
  ami                  = "ami-062f7200baf2fa504"
  instance_type        = "t1.micro"
  iam_instance_profile = aws_iam_instance_profile.iac_instance_profile.name

  network_interface {
    network_interface_id = aws_network_interface.iac_if.id
    device_index         = 0
  }

  depends_on = [aws_internet_gateway.iac_gw]

  tags = {
    Name = "iac_ec2_instance"
  }

}

