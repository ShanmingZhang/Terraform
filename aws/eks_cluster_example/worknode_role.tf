resource "aws_iam_role" "demo-worknode" {
  name = "terraform-eks-demo-worknode"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY

}

resource "aws_iam_role_policy_attachment" "demo-worknode-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.demo-worknode.name
}

resource "aws_iam_role_policy_attachment" "demo-worknode-AmazonEKSServicePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  role       = aws_iam_role.demo-worknode.name
}

resource "aws_iam_instance_profile" "demo-worknode-role-profile" {
  name = "demo-cluster-role-profile"
  role = aws_iam_role.demo-worknode.name
}

resource "aws_iam_role_policy_attachment" "demo-worknode-policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.demo-worknode.name
}

resource "aws_iam_role_policy_attachment" "demo-worknode-cni-policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.demo-worknode.name
}

resource "aws_iam_role_policy_attachment" "demo-worknode-ec2-container-registry-readonly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.demo-worknode.name
}

resource "aws_iam_role_policy_attachment" "demo-worknode-ec2-role-for-ssm" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
  role       = aws_iam_role.demo-worknode.name
}




