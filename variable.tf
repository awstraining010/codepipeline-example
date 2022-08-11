variable "aws_region" {
  default = "ap-south-1"
}

variable "profile" {
  default = "MyAWS"
}

variable "ec2_ami" {
  default = "ami-076e3a557efe1aa9c"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ec2_keypair" {
  default = "awskeypair"
}

variable "ec2_count" {
  type    = number
  default = "2"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "product" {
  default = "sales"
}

variable "vpc_id" {
  default = "vpc-094709b5eb21a6652"
}

variable "subnets" {
  default = ["subnet-074027fa02fa36260", "subnet-0e978dc5004946391"]
}