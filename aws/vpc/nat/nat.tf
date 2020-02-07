resource "aws_nat_gateway" "iac_nat" {
  allocation_id = aws_eip.iac_nat_ip.id
  subnet_id     = aws_subnet.iac_vpc_subnet_04.id

  tags = {
    Name = "iac_nat_gateway"
  }
  depends_on = [aws_internet_gateway.iac_igw]
}


