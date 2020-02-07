resource "aws_autoscaling_group" "iac_auto_group" {
  desired_capacity     = "2"
  launch_configuration = aws_launch_configuration.iac_eks_launch_cf.id
  max_size             = "3"
  min_size             = "1"
  name                 = "iac_eks_cluster"
  vpc_zone_identifier  = [ aws_subnet.iac_eks_vpc_subnet_01.id, aws_subnet.iac_eks_vpc_subnet_02.id, aws_subnet.iac_eks_vpc_subnet_01.id ]

  tag {
    key                 = "Name"
    value               = "iac_eks_auto_group"
    propagate_at_launch = true
  }

  tag {
    key                 = "kubernetes.io/cluster/${var.iac-eks-cluster-name}"
    value               = "owned"
    propagate_at_launch = true
  }
}
