# -- connect to outside internet -- #
resource "aws_internet_gateway" "iac_eks_gw" {
  vpc_id = aws_vpc.iac_eks_vpc.id

  tags = {
    Name = var.iac-gw-name
  }
}

