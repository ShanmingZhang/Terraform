resource "aws_instance" "iac_work_node_a" {
  ami           = "ami-0b69ea66ff7391e80"
  instance_type = "t2.micro"

  key_name = "zhang-key-pair-st2"

  iam_instance_profile = aws_iam_instance_profile.iac_worknodes_profile.name

  network_interface {
    network_interface_id = aws_network_interface.iac_worknode_a_if.id
    device_index         = 0
  }

  ebs_block_device {
    device_name = "/dev/xvda"
    volume_size = 30
  }

  depends_on = [aws_nat_gateway.iac_nat]

  tags = {
    Name = "iac-work-node-a"
  }

}


resource "aws_instance" "iac_work_node_b" {
  ami           = "ami-0b69ea66ff7391e80"
  instance_type = "t2.micro"

  key_name = "zhang-key-pair-st2"


  iam_instance_profile = aws_iam_instance_profile.iac_worknodes_profile.name

  network_interface {
    network_interface_id = aws_network_interface.iac_worknode_b_if.id
    device_index         = 0
  }

  ebs_block_device {
    device_name = "/dev/xvda"
    volume_size = 30
  }

  depends_on = [aws_nat_gateway.iac_nat]

  tags = {
    Name = "iac-work-node-b"
  }

}

resource "aws_instance" "iac_work_node_c" {
  ami           = "ami-0b69ea66ff7391e80"
  instance_type = "t2.micro"

  key_name = "zhang-key-pair-st2"


  iam_instance_profile = aws_iam_instance_profile.iac_worknodes_profile.name

  network_interface {
    network_interface_id = aws_network_interface.iac_worknode_c_if.id
    device_index         = 0
  }

  ebs_block_device {
    device_name = "/dev/xvda"
    volume_size = 30
  }

  depends_on = [aws_nat_gateway.iac_nat]

  tags = {
    Name = "iac-work-node-c"
  }

}

