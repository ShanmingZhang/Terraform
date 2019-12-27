provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_internet_gateway" "iac_gw" {
  vpc_id = aws_vpc.iac_vpc.id

  tags = {
    Name = "iac_gw"
  }
}

resource "aws_vpc" "iac_vpc" {
  cidr_block = "10.10.0.0/16"
  tags = {
    Name = "iac_vpc"
  }
}

resource "aws_subnet" "iac_subnet" {
  vpc_id            = aws_vpc.iac_vpc.id
  cidr_block        = "10.10.10.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "iac_subnet"
  }
}

resource "aws_network_interface" "iac_if" {
  subnet_id   = aws_subnet.iac_subnet.id
  private_ips = ["10.10.10.10"]

  tags = {
    Name = "iac_if"
  }
}

resource "aws_eip" "ip" {
  vpc        = true
  instance   = aws_instance.example.id
  depends_on = [aws_internet_gateway.iac_gw]
  tags = {
    Name = "iac_eip"
  }
}

resource "aws_instance" "example" {
  ami           = "ami-408c7f28"
  instance_type = "t1.micro"

  network_interface {
    network_interface_id = aws_network_interface.iac_if.id
    device_index         = 0
  }

  depends_on = [aws_internet_gateway.iac_gw]

  tags = {
    Name = "iac_ec2_instance"
  }

}

