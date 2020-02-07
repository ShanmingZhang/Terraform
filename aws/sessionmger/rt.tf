resource "aws_route_table" "iac_rtable" {
   vpc_id = aws_vpc.iac_vpc.id

   route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.iac_gw.id
   }

}

resource "aws_route_table_association" "iac_rt_association" {
  subnet_id = aws_subnet.iac_subnet.id
  route_table_id = aws_route_table.iac_rtable.id
}
