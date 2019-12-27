provider "aws" {
  region  = "us-east-1"
}

resource "aws_s3_bucket" "bucket_static_website_hosting" {
  bucket = "iac-website-test.com"
  acl    = "public-read"
  policy = file("policy.json")

  website {
    index_document = "index.html"
    error_document = "error.html"

    routing_rules = <<EOF
[{
    "Condition": {
        "KeyPrefixEquals": "docs/"
    },
    "Redirect": {
        "ReplaceKeyPrefixWith": "documents/"
    }
}]
EOF
  }
}
