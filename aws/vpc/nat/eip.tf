resource "aws_eip" "iac_instance_ip" {
  vpc        = true
  instance   = aws_instance.iac_instance.id
  depends_on = [aws_internet_gateway.iac_igw]
  tags = {
    Name = "iac_instance_eip"
  }
}

# -- nat gateway's elastic ip address -- #
resource "aws_eip" "iac_nat_ip" {
  vpc = true
}
