variable "region" {
  description = "AWS region."
  type        = string
  default     = "us-east-1"
}

variable "ec2_instance_name" {
  description = "EC2 instance name."
  type        = string
}

variable "s3_buckets" {
  description = "List of S3 buckets."
  type = map(object({
    bucket_name             = string
    block_public_acls       = bool
    block_public_policy     = bool
    ignore_public_acls      = bool
    restrict_public_buckets = bool
  }))
}

variable "ec2_instance_type" {
  description = "EC2 instance type."
  type        = string
}