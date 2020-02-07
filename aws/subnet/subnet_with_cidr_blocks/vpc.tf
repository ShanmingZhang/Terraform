resource "aws_vpc" "iac_main_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "iac_main_vpc"
  }
}
