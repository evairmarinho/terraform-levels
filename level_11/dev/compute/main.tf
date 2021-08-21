module "ec2" {
  source             = "../../modules/ec2/"
  instance_type      = var.compute_ec2_instance_type
  instance_name      = var.compute_ec2_instance_name
  instance_subnet_id = var.compute_ec2_instance_subnet_id
  bucket_arns        = var.data_s3_bucket_arns
}