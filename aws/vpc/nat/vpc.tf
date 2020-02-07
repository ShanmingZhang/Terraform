resource "aws_vpc" "iac_vpc" {
  cidr_block = "192.168.0.0/16"

  tags = {
    Name = "iac-vpc"
  }


  enable_dns_support   = true
  enable_dns_hostnames = true
}


