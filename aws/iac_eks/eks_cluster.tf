resource "aws_eks_cluster" "iac_eks_cluster" {
  name     = var.iac-eks-cluster-name
  role_arn = aws_iam_role.iac_eks_master_role.arn

  vpc_config {
    subnet_ids         = [aws_subnet.iac_eks_vpc_subnet_01.id, aws_subnet.iac_eks_vpc_subnet_02.id, aws_subnet.iac_eks_vpc_subnet_03.id]
    security_group_ids = [aws_security_group.iac_sg_eks_master.id]
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.iac-eks-master-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.iac-eks-master-AmazonEKSServicePolicy
  ]
}


