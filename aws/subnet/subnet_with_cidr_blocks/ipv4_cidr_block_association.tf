resource "aws_vpc_ipv4_cidr_block_association" "iac_ipv4_secondary_cidr" {
  vpc_id     = aws_vpc.iac_main_vpc.id
  cidr_block = "172.2.0.0/16"
}

