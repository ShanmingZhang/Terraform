resource "aws_ecr_repository" "iac_policy_on_tagged_image" {
  name = "iac_policy_on_tagged_image"
}

resource "aws_ecr_lifecycle_policy" "iac_policy_on_tagged_image" {
  repository = aws_ecr_repository.iac_policy_on_tagged_image.name

  policy = <<EOF
{
    "rules": [
        {
            "rulePriority": 1,
            "description": "Keep last 7 images",
            "selection": {
                "tagStatus": "tagged",
                "tagPrefixList": ["v"],
                "countType": "imageCountMoreThan",
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

