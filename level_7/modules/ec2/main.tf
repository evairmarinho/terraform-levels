resource "aws_instance" "level_7" {
  ami           = data.aws_ami.level_7_amzn_linux_2.id
  instance_type = var.instance_type
  tags = {
    Name = var.instance_name
  }
  iam_instance_profile = aws_iam_instance_profile.level_7.name
}

data "aws_ami" "level_7_amzn_linux_2" {
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

resource "aws_iam_instance_profile" "level_7" {
  name = "EC2_Instance_Profile_${var.instance_name}"
  role = aws_iam_role.level_7.name
}

resource "aws_iam_role" "level_7" {
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