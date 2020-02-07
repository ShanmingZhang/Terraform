resource "aws_instance" "iac_instance" {
  ami           = "ami-0b69ea66ff7391e80"
  instance_type = "t2.micro"

  key_name = "zhang-key-pair-st2"

  iam_instance_profile = aws_iam_instance_profile.iac_instance_profile.name

  network_interface {
    network_interface_id = aws_network_interface.iac_instance_if.id
    device_index         = 0
  }

  ebs_block_device {
    device_name = "/dev/xvda"
    volume_size = 30
  }

  depends_on = [aws_internet_gateway.iac_igw]

  tags = {
    Name = "iac-instance"
  }
}
