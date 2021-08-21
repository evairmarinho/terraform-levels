module "s3" {
  source                  = "../../modules/s3/"
  count                   = length(var.data_s3_buckets)
  bucket_name             = lookup(var.data_s3_buckets[count.index], "bucket_name", "")
  block_public_acls       = lookup(var.data_s3_buckets[count.index], "block_public_acls", true)
  block_public_policy     = lookup(var.data_s3_buckets[count.index], "block_public_policy", true)
  ignore_public_acls      = lookup(var.data_s3_buckets[count.index], "ignore_public_acls", true)
  restrict_public_buckets = lookup(var.data_s3_buckets[count.index], "restrict_public_buckets", true)
}