region = "us-east-1"

compute_ec2_instance_name      = "EC2_Level_11_HML"
compute_ec2_instance_type      = "t2.micro"
compute_ec2_instance_subnet_id = "subnet-123456789abcd"

data_s3_buckets = [
  {
    bucket_name             = "my-bucket-level-11-hml"
    block_public_acls       = false
    block_public_policy     = false
    ignore_public_acls      = true
    restrict_public_buckets = true
    }, {
    bucket_name             = "my-bucket-level-11-2-hml"
    block_public_acls       = false
    block_public_policy     = false
    ignore_public_acls      = true
    restrict_public_buckets = true
  }
]