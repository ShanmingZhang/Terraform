resource "aws_security_group" "iac_sg_instance" {
  name        = "iac-security-group-for-instance"
  description = " security for public instance"
  vpc_id      = aws_vpc.iac_vpc.id

  tags = {
    Name = "iac_sg_instance"
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "iac_sg_worknode" {
  name        = "iac-sg-worknode"
  description = "security for work nodes inside nat"
  vpc_id      = aws_vpc.iac_vpc.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {
    Name = "iac-sg-worknode"
  }
}


