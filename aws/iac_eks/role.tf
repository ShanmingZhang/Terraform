resource "aws_iam_role" "iac-ec2-session-manager-role" {
  name = var.iac-session-manager-role-name

  assume_role_policy = <<EOF
{
      "Version": "2012-10-17",
      "Statement": [
        {
          "Action": "sts:AssumeRole",
          "Principal": {
            "Service": "ec2.amazonaws.com"
          },
          "Effect": "Allow",
          "Sid": ""
        }
      ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "iac-session-mnger-AmazonEC2RoleforSSMPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
  role       = aws_iam_role.iac-ec2-session-manager-role.name
}

resource "aws_iam_role_policy_attachment" "iac-session-mnger-AmazonEC2ContainerRegistryFullAccessPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
  role       = aws_iam_role.iac-ec2-session-manager-role.name
}

resource "aws_iam_role_policy_attachment" "iac-session-mnger-AmazonS3FullAccessPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  role       = aws_iam_role.iac-ec2-session-manager-role.name
}

resource "aws_iam_role_policy_attachment" "iac-session-mnger-CloudWatchFullAccessPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchFullAccess"
  role       = aws_iam_role.iac-ec2-session-manager-role.name
}

resource "aws_iam_role_policy_attachment" "iac-session-mnger-CloudWatchLogsFullAccessPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"
  role       = aws_iam_role.iac-ec2-session-manager-role.name
}


resource "aws_iam_role" "iac-eks-cluster-role-name" {
  name = var.iac-eks-role-name

  assume_role_policy = <<EOF
{
      "Version": "2012-10-17",
      "Statement": [
        {
          "Action": "sts:AssumeRole",
          "Principal": {
            "Service": "eks.amazonaws.com"
          },
          "Effect": "Allow",
          "Sid": ""
        }
      ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "iac-eks-AmazonEKSServicePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  role       = aws_iam_role.iac-eks-cluster-role-name.name
}

resource "aws_iam_role_policy_attachment" "iac-eks-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.iac-eks-cluster-role-name.name
}

