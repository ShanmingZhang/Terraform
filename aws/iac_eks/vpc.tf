resource "aws_vpc" "iac_eks_vpc" {
  cidr_block = var.iac-vpc-cidr-block

  tags = {
    Name                                                = var.iac-vpc-name
    "kubernetes.io/cluster/${var.iac-eks-cluster-name}" = "shared"
  }


  enable_dns_support   = true
  enable_dns_hostnames = true
}


