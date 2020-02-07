resource "aws_eip" "iac_smger_ip" {
  vpc        = true
  instance   = aws_instance.iac_eks_session_manager.id
  depends_on = [aws_internet_gateway.iac_eks_gw]
  tags = {
    Name = "iac_eip"
  }
}

# -- nat gateway's elastic ip address -- #
resource "aws_eip" "iac_nat_ip" {
  vpc = true
}
