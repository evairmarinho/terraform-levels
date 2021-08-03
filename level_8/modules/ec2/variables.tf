variable "instance_name" {
  description = "EC2 instance name."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
}

variable "bucket_arn" {
  description = "S3 bucket ARN for Read Only Access IAM Policy."
  type        = string
}