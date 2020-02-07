resource "aws_iam_role" "iac-ec2-session-manager-role" {
  name = "iac_session_manager_role"

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

resource "aws_iam_instance_profile" "iac_instance_profile" {
  name = "iac_ec2_instance_profile"
  role = aws_iam_role.iac-ec2-session-manager-role.id
}

