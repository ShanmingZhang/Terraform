# -- connect to outside internet -- #
resource "aws_internet_gateway" "iac_igw" {
  vpc_id = aws_vpc.iac_vpc.id

  tags = {
    Name = "iac-internet-gateway"
  }
}

