resource "aws_network_interface" "iac_instance_if" {
  subnet_id   = aws_subnet.iac_vpc_subnet_04.id
  private_ips = [var.iac-config-of-subnet-04.instance_ip]

  security_groups = [aws_security_group.iac_sg_instance.id]

  tags = {
    Name = "iac_instance_if"
  }
}


resource "aws_network_interface" "iac_worknode_a_if" {
  subnet_id   = aws_subnet.iac_vpc_subnet_01.id
  private_ips = ["192.168.101.101"]

  security_groups = [aws_security_group.iac_sg_worknode.id]

  tags = {
    Name = "iac_worknode_a_if"
  }
}


resource "aws_network_interface" "iac_worknode_b_if" {
  subnet_id   = aws_subnet.iac_vpc_subnet_02.id
  private_ips = ["192.168.102.102"]

  security_groups = [aws_security_group.iac_sg_worknode.id]

  tags = {
    Name = "iac_worknode_b_if"
  }
}

resource "aws_network_interface" "iac_worknode_c_if" {
  subnet_id   = aws_subnet.iac_vpc_subnet_03.id
  private_ips = ["192.168.103.103"]

  security_groups = [aws_security_group.iac_sg_worknode.id]

  tags = {
    Name = "iac_worknode_c_if"
  }
}

