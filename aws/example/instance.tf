resource "aws_instance" "example" {
  ami           = "ami-408c7f28"
  instance_type = "t1.micro"

  network_interface {
    network_interface_id = aws_network_interface.iac_if.id
    device_index         = 0
  }

  tags = {
    Name = "iac_ec2_instance"
  }

}
