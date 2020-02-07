resource "aws_network_interface" "iac_eks_sgmer_if" {
  subnet_id   = aws_subnet.iac_eks_vpc_subnet_04.id
  private_ips = [var.iac-config-of-subnet-04.smger_ip]

  security_groups = [aws_security_group.iac_sg_smger.id]

  tags = {
    Name = "iac_eks_sgmer_if"
  }
}

