module "s3" {
  source                  = "./modules/s3/"
  count                   = length(var.s3_bucket_names)
  bucket_name             = var.s3_bucket_names[count.index]
  block_public_acls       = var.s3_block_public_acls
  block_public_policy     = var.s3_block_public_policy
  ignore_public_acls      = var.s3_ignore_public_acls
  restrict_public_buckets = var.s3_restrict_public_buckets
}

module "ec2" {
  source        = "./modules/ec2/"
  instance_type = var.ec2_instance_type
  instance_name = var.ec2_instance_name
  bucket_arns   = module.s3.*.bucket_arn
}