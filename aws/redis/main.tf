provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_vpc" "iac_redis_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "iac_redis_vpc"
  }
}

resource "aws_subnet" "iac_redis_subnet" {
  vpc_id     = aws_vpc.iac_redis_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "iac_redis_subnet"
  }
}

resource "aws_elasticache_subnet_group" "iac_redis_subnet_group"{
  name       = "iac-redis-subnet-group"
  subnet_ids = [aws_subnet.iac_redis_subnet.id]
}

