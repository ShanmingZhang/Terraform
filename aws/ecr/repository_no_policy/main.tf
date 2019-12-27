provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_ecr_repository" "iac_ecr_repository_no_policy" {
  name                 = "iac_ecr_repository_no_policy"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

