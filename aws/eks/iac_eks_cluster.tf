resource "aws_eks_cluster" "iac_eks_cluster" {
  name     = "iac_eks_cluster"
  role_arn = aws_iam_role.iac_eks_role.arn

  vpc_config {
     #subnet_ids = ["${aws_subnet.iac_eks_cluster_subnets.*.id}"]
     subnet_ids = aws_subnet.iac_eks_cluster_subnets.*.id
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.iac-eks-cluster-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.iac-eks-cluster-AmazonEKSServicePolicy
  ]
}

output "endpoint" {
  value = aws_eks_cluster.iac_eks_cluster.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.iac_eks_cluster.certificate_authority.0.data
}
