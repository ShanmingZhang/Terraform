data "aws_availability_zones" "iac_eks_cluster_zones" {
  state = "available"
}

resource "aws_vpc" "iac_eks_cluster_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "iac_eks_cluster_vpc"
  }
}

resource "aws_subnet" "iac_eks_cluster_subnets" {
  count = 2

  availability_zone = data.aws_availability_zones.iac_eks_cluster_zones.names[count.index]
  cidr_block        = cidrsubnet(aws_vpc.iac_eks_cluster_vpc.cidr_block, 8, count.index)
  vpc_id            = aws_vpc.iac_eks_cluster_vpc.id

  tags = {
    "kubernetes.io/cluster/iac_eks_cluster" = "shared"
  }
}


# resource "aws_subnet" "iac_eks_vpc_subnet_a" {
#  vpc_id            = aws_vpc.iac_eks_vpc.id
#  cidr_block        = "10.10.10.0/24"
#  availability_zone = "us-east-1a"
#
#  tags = {
#    Name                                                            = "iac_eks_vpc_subnet_a",
#  }
# }


# resource "aws_subnet" "iac_eks_vpc_subnet_b" {
#  vpc_id            = aws_vpc.iac_eks_vpc.id
#  cidr_block        = "10.10.20.0/24"
#  availability_zone = "us-east-1b"
#
#  tags = {
#    Name                                                            = "iac_eks_vpc_subnet_b",
#  }
# }

