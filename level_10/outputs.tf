output "s3_bucket_names" {
  description = "S3 bucket name."
  value       = [for i in module.s3.*.bucket_name : i]
}

output "s3_bucket_arns" {
  description = "S3 bucket ARN."
  value       = [for i in module.s3.*.bucket_arn : i]
}

output "ec2_instance_id" {
  description = "EC2 instance id."
  value       = module.ec2.instance_id
}