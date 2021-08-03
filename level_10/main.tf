module "s3" {
  source                  = "./modules/s3/"
  count                   = length(var.s3_buckets)
  bucket_name             = lookup(var.s3_buckets[count.index], "bucket_name", "")
  block_public_acls       = lookup(var.s3_buckets[count.index], "block_public_acls", true)
  block_public_policy     = lookup(var.s3_buckets[count.index], "block_public_policy", true)
  ignore_public_acls      = lookup(var.s3_buckets[count.index], "ignore_public_acls", true)
  restrict_public_buckets = lookup(var.s3_buckets[count.index], "restrict_public_buckets", true)
}

module "ec2" {
  source        = "./modules/ec2/"
  instance_type = var.ec2_instance_type
  instance_name = var.ec2_instance_name
  bucket_arns   = module.s3.*.bucket_arn
}