resource "aws_subnet" "iac_subnet" {
  vpc_id     = aws_vpc.iac_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "MainSubnet"
  }
}
