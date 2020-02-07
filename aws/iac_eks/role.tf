resource "aws_iam_role" "iac_ec2_session_manager_role" {
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
  role       = aws_iam_role.iac_ec2_session_manager_role.name
}

resource "aws_iam_role_policy_attachment" "iac-session-mnger-AmazonEC2ContainerRegistryFullAccessPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
  role       = aws_iam_role.iac_ec2_session_manager_role.name
}

resource "aws_iam_role_policy_attachment" "iac-session-mnger-AmazonS3FullAccessPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  role       = aws_iam_role.iac_ec2_session_manager_role.name
}

resource "aws_iam_role_policy_attachment" "iac-session-mnger-CloudWatchFullAccessPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchFullAccess"
  role       = aws_iam_role.iac_ec2_session_manager_role.name
}

resource "aws_iam_role_policy_attachment" "iac-session-mnger-CloudWatchLogsFullAccessPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"
  role       = aws_iam_role.iac_ec2_session_manager_role.name
}

# --- --- #
resource "aws_iam_instance_profile" "iac_eks_smger_profile" {
  name = "iac_eks_smger_profile"
  role = aws_iam_role.iac_ec2_session_manager_role.id
}
# --- --- #

resource "aws_iam_role" "iac_eks_master_role" {
  name = var.iac-eks-master-role-name

  assume_role_policy = <<EOF
{
      "Version": "2012-10-17",
      "Statement": [
        {
          "Action": "sts:AssumeRole",
          "Principal": {
            "Service": "eks.amazonaws.com"
          },
          "Effect": "Allow"
        }
      ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "iac-eks-master-AmazonEKSServicePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  role       = aws_iam_role.iac_eks_master_role.name
}

resource "aws_iam_role_policy_attachment" "iac-eks-master-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.iac_eks_master_role.name
}


# --- --- #
resource "aws_iam_role" "iac_eks_worknodes_role" {
  name = var.iac-eks-worknodes-role-name

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role_policy_attachment" "iac-eks-worknodes-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.iac_eks_worknodes_role.name
}

resource "aws_iam_role_policy_attachment" "iac-eks-worknodes-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.iac_eks_worknodes_role.name
}

resource "aws_iam_role_policy_attachment" "iac-eks-worknodes-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.iac_eks_worknodes_role.name
}

resource "aws_iam_instance_profile" "iac_eks_worknodes_profile" {
  name = var.iac-eks-worknodes-profile
  role = aws_iam_role.iac_eks_worknodes_role.name
}





