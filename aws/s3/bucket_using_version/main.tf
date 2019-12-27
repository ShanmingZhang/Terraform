provider "aws" {
  profile = "default"
  region  = "us-east-1"
}


resource "aws_s3_bucket" "iac_using_versioning" {
  bucket = "iac-my-tf-test-bucket"
  acl    = "private"

  versioning {
    enabled = true
  }
}

