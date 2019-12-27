resource "aws_kms_key" "iac-s3-key" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
}

resource "aws_s3_bucket" "iac-s3-kms-bucket" {
  for_each = toset(var.iac-s3-bucket-name)
  bucket   = each.key

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.iac-s3-key.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }
}

