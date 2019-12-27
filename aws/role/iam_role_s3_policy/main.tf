provider "aws" {
  profile  = "default"
  region   = "us-east-1"
}

resource "aws_iam_role" "iac-s3-policy-role" {
  name = "iac_s3_policy_role"

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

resource "aws_iam_policy" "iac-role-s3-policy" {
  name        = "iac-role-s3-policy"
  description = "A test policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "iac-role-s3-policy-test-attach" {
  role       = aws_iam_role.iac-s3-policy-role.name
  policy_arn = aws_iam_policy.iac-role-s3-policy.arn
}
