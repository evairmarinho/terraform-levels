module "s3" {
  source                  = "./modules/s3/"
  for_each                = toset(var.s3_bucket_names)
  bucket_name             = each.key
  block_public_acls       = var.s3_block_public_acls
  block_public_policy     = var.s3_block_public_policy
  ignore_public_acls      = var.s3_ignore_public_acls
  restrict_public_buckets = var.s3_restrict_public_buckets
}

module "ec2" {
  source        = "./modules/ec2/"
  instance_type = var.ec2_instance_type
  instance_name = var.ec2_instance_name
  bucket_arns   = [for i in module.s3 : i.bucket_arn]
}