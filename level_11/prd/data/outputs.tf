output "data_s3_bucket_names" {
  description = "S3 bucket name."
  value       = [for i in module.s3.*.bucket_name : i]
}

output "data_s3_bucket_arns" {
  description = "S3 bucket ARN."
  value       = [for i in module.s3.*.bucket_arn : i]
}