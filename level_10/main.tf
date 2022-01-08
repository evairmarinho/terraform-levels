module "s3" {
  source                  = "./modules/s3/"
  for_each                = var.s3_buckets
  bucket_name             = each.value.bucket_name
  block_public_acls       = try(each.value.block_public_acls, true)
  block_public_policy     = try(each.value.block_public_policy, true)
  ignore_public_acls      = try(each.value.ignore_public_acls, true)
  restrict_public_buckets = try(each.value.restrict_public_buckets, true)
}

module "ec2" {
  source        = "./modules/ec2/"
  instance_type = var.ec2_instance_type
  instance_name = var.ec2_instance_name
  bucket_arns   = [for i in module.s3 : i.bucket_arn]
}