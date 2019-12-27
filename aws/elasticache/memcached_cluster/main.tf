provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_vpc" "iac_memcached_vpc" {
  cidr_block = "10.1.0.0/16"

  tags = {
    Name = "iac_memcached_vpc"
  }
}

resource "aws_subnet" "iac_memcached_subnet" {
  vpc_id            = aws_vpc.iac_memcached_vpc.id
  cidr_block        = "10.1.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "iac_memcached_subnet"
  }
}

resource "aws_elasticache_subnet_group" "iac_memcached_subnet_group" {
  name       = "iac-memcached-subnet-group"
  subnet_ids = [aws_subnet.iac_memcached_subnet.id]
}

