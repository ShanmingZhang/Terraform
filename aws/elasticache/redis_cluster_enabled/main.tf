provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_vpc" "iac_redis_cluster_enabled_vpc" {
  cidr_block = "10.10.0.0/16"

  tags = {
    Name = "iac_redis_cluster_enabled_vpc"
  }
}

resource "aws_subnet" "iac_redis_cluster_enabled_subnet" {
  vpc_id            = aws_vpc.iac_redis_cluster_enabled_vpc.id
  cidr_block        = "10.10.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "iac_redis_cluster_enabled_subnet"
  }
}

resource "aws_elasticache_subnet_group" "iac_redis_cluster_enabled_subnet_group" {
  name       = "iac-redis-cluster-enabled-subnet-group"
  subnet_ids = [aws_subnet.iac_redis_cluster_enabled_subnet.id]
}

