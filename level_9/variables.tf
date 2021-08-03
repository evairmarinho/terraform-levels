variable "region" {
  description = "AWS region."
  type        = string
  default     = "us-east-1"
}

variable "s3_block_public_acls" {
  description = "Whether Amazon S3 should block public ACLs for this bucket."
  type        = bool
}
variable "s3_block_public_policy" {
  description = "Whether Amazon S3 should block public bucket policies for this bucket."
  type        = bool
}

variable "s3_ignore_public_acls" {
  description = "Whether Amazon S3 should ignore public ACLs for this bucket."
  type        = bool
}
variable "s3_restrict_public_buckets" {
  description = "Whether Amazon S3 should restrict public bucket policies for this bucket."
  type        = bool
}

variable "s3_bucket_names" {
  description = "S3 bucket name."
  type        = list(string)
}


variable "ec2_instance_name" {
  description = "EC2 instance name."
  type        = string
}

variable "ec2_instance_type" {
  description = "EC2 instance type."
  type        = string
}