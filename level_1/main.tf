resource "aws_s3_bucket" "level_1" {
  bucket = "my-level-1-bucket"
}

resource "aws_s3_bucket_public_access_block" "level_1" {
  bucket                  = aws_s3_bucket.level_1.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}