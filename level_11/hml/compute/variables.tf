variable "data_s3_bucket_arns" {
  description = "S3 bucket ARNs for Read Only Access IAM Policy."
  type        = list(string)
}

variable "compute_ec2_instance_name" {
  description = "EC2 instance name."
  type        = string
}

variable "compute_ec2_instance_type" {
  description = "EC2 instance type."
  type        = string
}

variable "compute_ec2_instance_subnet_id" {
  description = "EC2 subnet ID."
  type        = string
}