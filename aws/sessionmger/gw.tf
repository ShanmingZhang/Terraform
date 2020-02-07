resource "aws_internet_gateway" "iac_gw" {
  vpc_id = aws_vpc.iac_vpc.id

  tags = {
    Name = "iac_gw"
  }
}
