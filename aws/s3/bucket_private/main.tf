provider "aws" {
  profile = "default"
  region  = "us-east-1"
}


resource "aws_s3_bucket" "iac_private_bucket" {
  bucket = "iac-private-bucket"
  acl    = "private"

  tags = {
    Name        = "iac-private-bucket"
    Environment = "Dev"
  }
}

