resource "aws_security_group" "iac_sg_smger" {
  name        = "iac-session-group-for-session-manager"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.iac_eks_vpc.id

  tags = {
    Name = "iac_sg_session_manager"
  }

  ingress {
    # TLS (change to whatever ports you need)
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = ["192.168.0.0/24"]
  }


  ingress {
    # TLS (change to whatever ports you need)
    from_port = 443
    to_port   = 443
    protocol  = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = ["192.168.0.0/24"]
  }

  ingress {
    # TLS (change to whatever ports you need)
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = ["192.168.0.0/24"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_security_group" "iac_sg_redis" {
  name        = "iac-session-group-for-redis"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.iac_eks_vpc.id

  tags = {
    Name = "iac_sg_for_redis"
  }

  ingress {
    # TLS (change to whatever ports you need)
    from_port = 6379
    to_port   = 6379
    protocol  = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = ["192.168.0.0/24"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_security_group" "iac_sg_eks_master" {
  name        = var.iac-eks-master-sg-name
  description = "eks master communicates with others"
  vpc_id      = aws_vpc.iac_eks_vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.iac-eks-master-sg-name
  }
}

resource "aws_security_group_rule" "iac_eks_master_ingress_rule_https" {
  cidr_blocks       = ["0.0.0.0/0"]
  description       = " allow others to connect into with https"
  from_port         = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.iac_sg_eks_master.id
  to_port           = 443
  type              = "ingress"
}

resource "aws_security_group" "iac_sg_eks_worknodes" {
  name        = var.iac-eks-worknodes-sg-name
  description = "worknodes communicate with others"
  vpc_id      = aws_vpc.iac_eks_vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.iac-eks-worknodes-sg-name
  }
}

# -- for outside work stations
resource "aws_security_group_rule" "iac_eks_worknodes_ingress_rule_ssh" {
  cidr_blocks       = ["0.0.0.0/0"]
  description       = " allow others to connect into with ssh"
  from_port         = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.iac_sg_eks_worknodes.id
  to_port           = 22
  type              = "ingress"
}

# -- for communication between worknodes
resource "aws_security_group_rule" "iac_eks_worknodes_ingress_rule_self" {
  description              = " allow others to connect into with ssh"
  from_port                = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.iac_sg_eks_worknodes.id
  source_security_group_id = aws_security_group.iac_sg_eks_worknodes.id
  to_port                  = 65535
  type                     = "ingress"
}

# -- for communication between kubelets and pods of worknodes and master
resource "aws_security_group_rule" "iac_eks_worknodes_ingress_rule_master" {
  description              = " allow kubelets and pods inside worknodes to communicate with master"
  from_port                = 1025
  protocol                 = "tcp"
  security_group_id        = aws_security_group.iac_sg_eks_worknodes.id
  source_security_group_id = aws_security_group.iac_sg_eks_master.id
  to_port                  = 65535
  type                     = "ingress"
}

# -- for communication between kubelets and pods of worknodes and master
resource "aws_security_group_rule" "iac_eks_worknodes_ingress_rule_master_https" {
  description              = " allow kubelets and pods inside worknodes to communicate with master"
  from_port                = 443
  protocol                 = "tcp"
  security_group_id        = aws_security_group.iac_sg_eks_worknodes.id
  source_security_group_id = aws_security_group.iac_sg_eks_master.id
  to_port                  = 443
  type                     = "ingress"
}


# -- for communication between kubelets and pods of worknodes and master
resource "aws_security_group_rule" "iac_eks_master_ingress_rule_worknode_https" {
  description              = "allow kubelets and pods inside worknodes to communicate with master"
  from_port                = 443
  protocol                 = "tcp"
  security_group_id        = aws_security_group.iac_sg_eks_master.id
  source_security_group_id = aws_security_group.iac_sg_eks_worknodes.id
  to_port                  = 443
  type                     = "ingress"
}











