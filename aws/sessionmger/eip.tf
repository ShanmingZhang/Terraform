resource "aws_eip" "ip" {
  vpc        = true
  instance   = aws_instance.iac_ec2_instance.id
  depends_on = [aws_internet_gateway.iac_gw]
  tags = {
    Name = "iac_eip"
  }
}

