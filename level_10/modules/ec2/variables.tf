variable "instance_name" {
  description = "EC2 instance name."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
}

variable "bucket_arns" {
  description = "S3 bucket ARNs for Read Only Access IAM Policy."
  type        = list(string)
}