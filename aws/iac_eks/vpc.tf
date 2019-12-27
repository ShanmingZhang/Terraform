resource "aws_vpc" "iac-eks-vpc" {
  cidr_block = var.iac-vpc-cidr-block
  tags = {
    Name = var.iac-vpc-name
  }
}

resource "aws_subnet" "iac-eks-vpc-subnets" {
  count = length(var.iac-cidr-block-of-subnets)
  vpc_id            = aws_vpc.iac-eks-vpc.id
  cidr_block        = var.iac-cidr-block-of-subnets[count.index]
  availability_zone = var.iac-subnet-available-zones[count.index]

  tags = {
    Name = var.iac-subnet-names[count.index]
  }
}

resource "aws_elasticache_subnet_group" "iac-redis-subnet-group" {
  name       = var.iac-redis-subnet-group-name
  subnet_ids = aws_subnet.iac-eks-vpc-subnets[*].id
}

