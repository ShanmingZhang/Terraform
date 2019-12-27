resource "aws_vpc" "iac_redis_cluster_disabled_vpc" {
  cidr_block = "10.1.0.0/16"

  tags = {
    Name = "iac_redis_cluster_disabled_vpc"
  }
}

resource "aws_subnet" "iac_redis_cluster_disabled_subnet_a" {
  vpc_id            = aws_vpc.iac_redis_cluster_disabled_vpc.id
  cidr_block        = "10.1.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "iac_redis_cluster_disabled_subnet_a"
  }
}

resource "aws_subnet" "iac_redis_cluster_disabled_subnet_b" {
  vpc_id            = aws_vpc.iac_redis_cluster_disabled_vpc.id
  cidr_block        = "10.1.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "iac_redis_cluster_disabled_subnet_b"
  }
}

resource "aws_subnet" "iac_redis_cluster_disabled_subnet_c" {
  vpc_id            = aws_vpc.iac_redis_cluster_disabled_vpc.id
  cidr_block        = "10.1.3.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "iac_redis_cluster_disabled_subnet_c"
  }
}

resource "aws_elasticache_subnet_group" "iac_redis_cluster_disabled_subnet_group" {
  name       = "iac-redis-cluster-disabled-subnet-group"
  subnet_ids = [aws_subnet.iac_redis_cluster_disabled_subnet_a.id, aws_subnet.iac_redis_cluster_disabled_subnet_b.id, aws_subnet.iac_redis_cluster_disabled_subnet_c.id]
}

