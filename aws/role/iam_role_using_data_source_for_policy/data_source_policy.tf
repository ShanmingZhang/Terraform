data "aws_iam_policy_document" "iac-instance-assume-role-policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "iac-instance" {
  name               = "iac_instance_role"
  path               = "/system/"
  assume_role_policy = data.aws_iam_policy_document.iac-instance-assume-role-policy.json
}

