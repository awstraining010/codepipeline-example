terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.profile

}

resource "aws_instance" "ec2-instance" {
  ami                    = var.ec2_ami
 # instance_name          = "webserver.${var.environment}.${var.product}-${count.index + 1}"
  instance_type          = var.instance_type
  key_name               = var.ec2_keypair
  count                  = var.ec2_count
  vpc_security_group_ids = ["${aws_security_group.ec2-sg.id}"]
  subnet_id              = element(var.subnets, count.index)
  tags = {
    Name = "webserver.${var.environment}.${var.product}-${count.index + 1}"
  }
  # Installing Appachi software on EC2 instances using user data...
  user_data = file("userdata.sh")
}
