
# -- route for internet through internet gateway
resource "aws_route_table" "iac_eks_gw_rt" {
  vpc_id = aws_vpc.iac_eks_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.iac_eks_gw.id
  }
}

resource "aws_route_table_association" "iac_eks_gw_rt_association_04" {
  subnet_id      = aws_subnet.iac_eks_vpc_subnet_04.id
  route_table_id = aws_route_table.iac_eks_gw_rt.id
}


resource "aws_route_table" "iac_eks_rt" {
  vpc_id = aws_vpc.iac_eks_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.iac_eks_nat.id
  }

  tags = {
    Name = "iac-eks-nat-route-table"
  }

}

resource "aws_route_table_association" "iac_eks_rt_association_01" {
  subnet_id      = aws_subnet.iac_eks_vpc_subnet_01.id
  route_table_id = aws_route_table.iac_eks_rt.id
}

resource "aws_route_table_association" "iac_eks_rt_association_02" {
  subnet_id      = aws_subnet.iac_eks_vpc_subnet_02.id
  route_table_id = aws_route_table.iac_eks_rt.id
}

resource "aws_route_table_association" "iac_eks_rt_association_03" {
  subnet_id      = aws_subnet.iac_eks_vpc_subnet_03.id
  route_table_id = aws_route_table.iac_eks_rt.id
}

