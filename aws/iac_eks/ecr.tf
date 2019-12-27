resource "aws_ecr_repository" "iac-ecr-repositories" {
  count = length(var.iac-ecr-repository-name-list)
  name  = var.iac-ecr-repository-name-list[count.index]
}


resource "aws_ecr_lifecycle_policy" "iac_ecr_repositories_lifecycle_policy" {
  count      = length(var.iac-ecr-repository-name-list)
  repository = aws_ecr_repository.iac-ecr-repositories[count.index].name

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

