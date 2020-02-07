
# -- route for internet through internet gateway
resource "aws_route_table" "iac_igw_rt" {
  vpc_id = aws_vpc.iac_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.iac_igw.id
  }

  tags = {
    Name = "iac-igw-custom-route-table"
  }
}

resource "aws_route_table_association" "iac_igw_rt_association_04" {
  subnet_id      = aws_subnet.iac_vpc_subnet_04.id
  route_table_id = aws_route_table.iac_igw_rt.id
}


resource "aws_route_table" "iac_rt" {
  vpc_id = aws_vpc.iac_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.iac_nat.id
  }

  tags = {
    Name = "iac-nat-main-route-table"
  }

}

resource "aws_route_table_association" "iac_rt_association_01" {
  subnet_id      = aws_subnet.iac_vpc_subnet_01.id
  route_table_id = aws_route_table.iac_rt.id
}

resource "aws_route_table_association" "iac_rt_association_02" {
  subnet_id      = aws_subnet.iac_vpc_subnet_02.id
  route_table_id = aws_route_table.iac_rt.id
}

resource "aws_route_table_association" "iac_rt_association_03" {
  subnet_id      = aws_subnet.iac_vpc_subnet_03.id
  route_table_id = aws_route_table.iac_rt.id
}

resource "aws_main_route_table_association" "iac_main_route_table" {
  vpc_id         = aws_vpc.iac_vpc.id
  route_table_id = aws_route_table.iac_rt.id
}
