#resource "aws_kms_key" "iac_s3_key" {
#  description             = "This key is used to encrypt bucket objects"
#  deletion_window_in_days = 10
#}

#resource "aws_s3_bucket" "iac_s3_kms_bucket" {
#  for_each = toset(var.iac-s3-bucket-name)
#  bucket   = each.key
#
#  server_side_encryption_configuration {
#    rule {
#      apply_server_side_encryption_by_default {
#        kms_master_key_id = aws_kms_key.iac_s3_key.arn
#        sse_algorithm     = "aws:kms"
#      }
#    }
#  }
#}


resource "aws_s3_bucket" "iac_s3_bucket" {
  for_each = toset(var.iac-s3-bucket-name)
  bucket   = each.key
}


resource "aws_s3_bucket_public_access_block" "iac_s3_access" {
  for_each                = toset(var.iac-s3-bucket-name)
  bucket                  = each.key
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
