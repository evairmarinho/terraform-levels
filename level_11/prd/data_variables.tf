variable "data_s3_buckets" {
  description = "List of S3 buckets."
  type = map(object({
    bucket_name             = string
    block_public_acls       = bool
    block_public_policy     = bool
    ignore_public_acls      = bool
    restrict_public_buckets = bool
  }))
}