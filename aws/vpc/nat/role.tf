resource "aws_iam_role" "iac_instance_role" {
  name = "iac-instance-role"

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

resource "aws_iam_role_policy_attachment" "iac-instance-AmazonEC2RoleforSSMPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
  role       = aws_iam_role.iac_instance_role.name
}

resource "aws_iam_role_policy_attachment" "iac-instance-AmazonEC2ContainerRegistryFullAccessPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
  role       = aws_iam_role.iac_instance_role.name
}

resource "aws_iam_role_policy_attachment" "iac-instance-AmazonS3FullAccessPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  role       = aws_iam_role.iac_instance_role.name
}

resource "aws_iam_role_policy_attachment" "iac-instance-CloudWatchFullAccessPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchFullAccess"
  role       = aws_iam_role.iac_instance_role.name
}

resource "aws_iam_role_policy_attachment" "iac-instance-CloudWatchLogsFullAccessPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"
  role       = aws_iam_role.iac_instance_role.name
}

# --- --- #
resource "aws_iam_instance_profile" "iac_instance_profile" {
  name = "iac_instance_profile"
  role = aws_iam_role.iac_instance_role.id
}
# --- --- #


# --- --- #
resource "aws_iam_role" "iac_worknodes_role" {
  name = "iac-worknodes-role"

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

resource "aws_iam_role_policy_attachment" "iac-worknodes-AmazonS3FullAccessPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  role       = aws_iam_role.iac_worknodes_role.name
}

resource "aws_iam_instance_profile" "iac_worknodes_profile" {
  name = "iac-worknodes-profile"
  role = aws_iam_role.iac_worknodes_role.name
}

