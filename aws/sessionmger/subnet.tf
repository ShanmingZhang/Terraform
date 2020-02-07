resource "aws_subnet" "iac_subnet" {
  vpc_id            = aws_vpc.iac_vpc.id
  cidr_block        = "10.10.10.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "iac_subnet"
  }
}

