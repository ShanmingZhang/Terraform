resource "aws_subnet" "iac_eks_vpc_subnet_01" {
  vpc_id            = aws_vpc.iac_eks_vpc.id
  cidr_block        = var.iac-config-of-subnet-01.cidr_block
  availability_zone = var.iac-config-of-subnet-01.availability_zone

  tags = {
    Name                                                = var.iac-config-of-subnet-01.name
    "kubernetes.io/cluster/${var.iac-eks-cluster-name}" = "shared"
  }
}


resource "aws_subnet" "iac_eks_vpc_subnet_02" {
  vpc_id            = aws_vpc.iac_eks_vpc.id
  cidr_block        = var.iac-config-of-subnet-02.cidr_block
  availability_zone = var.iac-config-of-subnet-02.availability_zone

  tags = {
    Name                                                = var.iac-config-of-subnet-02.name
    "kubernetes.io/cluster/${var.iac-eks-cluster-name}" = "shared"
  }
}


resource "aws_subnet" "iac_eks_vpc_subnet_03" {
  vpc_id            = aws_vpc.iac_eks_vpc.id
  cidr_block        = var.iac-config-of-subnet-03.cidr_block
  availability_zone = var.iac-config-of-subnet-03.availability_zone

  tags = {
    Name                                                = var.iac-config-of-subnet-03.name
    "kubernetes.io/cluster/${var.iac-eks-cluster-name}" = "shared"
  }
}


# --  session manager and internet gateway -- #
resource "aws_subnet" "iac_eks_vpc_subnet_04" {
  vpc_id            = aws_vpc.iac_eks_vpc.id
  cidr_block        = var.iac-config-of-subnet-04.cidr_block
  availability_zone = var.iac-config-of-subnet-04.availability_zone

  tags = {
    Name = var.iac-config-of-subnet-04.name
  }
}

