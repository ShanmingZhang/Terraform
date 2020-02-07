resource "aws_subnet" "iac_in_secondary_cidr" {
  vpc_id     = aws_vpc_ipv4_cidr_block_association.iac_ipv4_secondary_cidr.vpc_id
  cidr_block = "172.2.0.0/24"
}

