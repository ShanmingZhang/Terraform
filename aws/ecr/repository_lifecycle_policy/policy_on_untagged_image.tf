resource "aws_ecr_repository" "iac_policy_on_untagged_image" {
  name = "iac_policy_on_untagged_image"
}

resource "aws_ecr_lifecycle_policy" "iac_policy_on_untagged_image" {
  repository = aws_ecr_repository.iac_policy_on_untagged_image.name

  policy = <<EOF
{
    "rules": [
        {
            "rulePriority": 1,
            "description": "Expire images older than 7 days",
            "selection": {
                "tagStatus": "untagged",
                "countType": "sinceImagePushed",
                "countUnit": "days",
                "countNumber": 7
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
EOF
}

