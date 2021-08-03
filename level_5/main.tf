module "s3" {
  source                  = "./modules/"
  bucket_name             = "my-level-5-bucket"
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}