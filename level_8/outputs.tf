output "s3_bucket_name" {
  description = "S3 bucket name."
  value       = module.s3.bucket_name
}

output "s3_bucket_arn" {
  description = "S3 bucket ARN."
  value       = module.s3.bucket_arn
}

output "ec2_instance_id" {
  description = "EC2 instance id."
  value       = module.ec2.instance_id
}