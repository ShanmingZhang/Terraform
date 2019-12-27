resource "aws_vpc" "iac_smger_vpc" {
  cidr_block = "10.10.0.0/16"
  tags = {
    Name = "iac_smger_vpc"
  }
}

resource "aws_subnet" "iac_smger_subnet" {
  vpc_id            = aws_vpc.iac_smger_vpc.id
  cidr_block        = "10.10.10.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "iac_smger_subnet"
  }
}

resource "aws_network_interface" "iac_smger_if" {
  subnet_id   = aws_subnet.iac_smger_subnet.id
  private_ips = ["10.10.10.10"]

  tags = {
    Name = "iac_smger_if"
  }
}

