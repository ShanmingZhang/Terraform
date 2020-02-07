data "aws_ami" "iac_eks_worknode" {
  filter {
    name   = "name"
    values = ["amazon-eks-node-1.14-v20191213"]
  }

  most_recent = true
  owners      = ["amazon"]
}


resource "aws_launch_configuration" "iac_eks_launch_cf" {
  associate_public_ip_address = true
  iam_instance_profile        = aws_iam_instance_profile.iac_eks_worknodes_profile.name
  image_id                    = data.aws_ami.iac_eks_worknode.id
  instance_type               = "c5.4xlarge"
  name_prefix                 = "iac-tf-eks-cluster"
  security_groups             = [aws_security_group.iac_sg_eks_worknodes.id]
  user_data_base64            = base64encode(local.tf-eks-node-userdata)
  key_name                    = "zhang-key-pair-st2"


  lifecycle {
    create_before_destroy = true
  }
}



#resource "aws_eks_node_group" "iac_eks_worknodes" {
#  cluster_name    = aws_eks_cluster.iac_eks_cluster.name
#  node_group_name = var.iac-eks-worknodes-group-name
#  node_role_arn   = aws_iam_role.iac_eks_worknodes_role.arn
#  subnet_ids      = [aws_subnet.iac_eks_vpc_subnet_01.id, aws_subnet.iac_eks_vpc_subnet_02.id, aws_subnet.iac_eks_vpc_subnet_03.id]
#  instance_types  = ["c5.4xlarge"]
#  #instance_types = ["t2.micro"]
#  scaling_config {
#    desired_size = 2
#    max_size     = 3
#    min_size     = 1
#  }
#
#  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
#  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
#  depends_on = [
#    aws_iam_role_policy_attachment.iac-eks-worknodes-AmazonEKSWorkerNodePolicy,
#    aws_iam_role_policy_attachment.iac-eks-worknodes-AmazonEKS_CNI_Policy,
#    aws_iam_role_policy_attachment.iac-eks-worknodes-AmazonEC2ContainerRegistryReadOnly
#  ]
#
#  tags = {
#    Name = "iac-eks-worknode-group"
#  }
#}
