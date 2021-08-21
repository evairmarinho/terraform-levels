resource "aws_instance" "level_11" {
  ami           = data.aws_ami.level_11_amzn_linux_2.id
  instance_type = var.instance_type
  subnet_id     = var.instance_subnet_id
  tags = {
    Name = var.instance_name
  }
  iam_instance_profile = aws_iam_instance_profile.level_11.name
}

data "aws_ami" "level_11_amzn_linux_2" {
  most_recent = true


  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }


  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }

  owners = ["amazon"]
}

resource "aws_iam_instance_profile" "level_11" {
  name = "EC2_Instance_Profile_${var.instance_name}"
  role = aws_iam_role.level_11.name
}

resource "aws_iam_role" "level_11" {
  name = "EC2_Role_${var.instance_name}"
  path = "/"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}



data "aws_iam_policy_document" "level_11" {
  statement {
    sid    = "OnlyBucket"
    effect = "Allow"
    actions = [
      "s3:ListBucketMultipartUploads",
      "s3:ListBucket",
      "s3:GetBucketAcl",
      "s3:GetBucketLocation"
    ]

    resources = var.bucket_arns

  }

  statement {
    sid    = "BucketObjects"
    effect = "Allow"
    actions = [
      "s3:GetObjectAcl",
      "s3:GetObject",
      "s3:ListMultipartUploadParts"
    ]

    resources = [for i in var.bucket_arns : "${i}/*"]
  }
}

resource "aws_iam_policy" "level_11" {
  name   = "EC2_Policy_${var.instance_name}"
  path   = "/"
  policy = data.aws_iam_policy_document.level_11.json
}

resource "aws_iam_policy_attachment" "level_11" {
  name       = "ec2_attachment_${var.instance_name}"
  roles      = [aws_iam_role.level_11.name]
  policy_arn = aws_iam_policy.level_11.arn
}