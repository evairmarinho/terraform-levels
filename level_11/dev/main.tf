module "data" {
  source          = "./data/"
  data_s3_buckets = var.data_s3_buckets
}

module "compute" {
  source                         = "./compute/"
  compute_ec2_instance_type      = var.compute_ec2_instance_type
  compute_ec2_instance_name      = var.compute_ec2_instance_name
  compute_ec2_instance_subnet_id = var.compute_ec2_instance_subnet_id
  data_s3_bucket_arns            = module.data.data_s3_bucket_arns
}