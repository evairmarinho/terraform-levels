output "data_s3_bucket_names" {
  description = "S3 bucket name."
  value       = [for i in module.s3 : i.bucket_name]
}

output "data_s3_bucket_arns" {
  description = "S3 bucket ARN."
  value       = [for i in module.s3 : i.bucket_arn]
}