provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_iam_role" "iac_iam_role" {
  name = "iac_iam_role"

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
