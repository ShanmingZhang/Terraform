## attaches a managed IAM policy to an IAM role
## define a role
resource "aws_iam_role" "iac_policy_role" {
  name = "iac-policy-test-role"

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

## defines a policy
resource "aws_iam_policy" "iac_attachment_policy" {
  name        = "iac-attachment-test-policy"
  description = "A test policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

## define a attachment and connect the role and policy
resource "aws_iam_role_policy_attachment" "iac-policy-test-attach" {
  role       = aws_iam_role.iac_policy_role.name
  policy_arn = aws_iam_policy.iac_attachment_policy.arn
}


