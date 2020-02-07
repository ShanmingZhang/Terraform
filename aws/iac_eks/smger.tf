resource "aws_instance" "iac_eks_session_manager" {
  ami           = "ami-0b69ea66ff7391e80"
  instance_type = "t2.micro"

  iam_instance_profile = aws_iam_instance_profile.iac_eks_smger_profile.name

  network_interface {
    network_interface_id = aws_network_interface.iac_eks_sgmer_if.id
    device_index         = 0
  }

  ebs_block_device {
    device_name = "/dev/xvda"
    #volume_type = "standard"
    volume_size = 30
  }

  #depends_on = [aws_internet_gateway.iac_eks_gw]
  depends_on = [aws_nat_gateway.iac_eks_nat]

  tags = {
    Name = var.iac-session-manager-name
  }

}
