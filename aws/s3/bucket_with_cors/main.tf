provider "aws" {
  profile = "default"
  region  = "us-east-1"
}


resource "aws_s3_bucket" "iac_using_cors" {
  bucket = "iac-s3-website-test.hashicorp.com"
  acl    = "public-read"

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["PUT", "POST"]
    allowed_origins = ["https://iac-s3-website-test.hashicorp.com"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }
}
