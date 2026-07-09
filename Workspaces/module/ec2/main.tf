provider "aws" {
  region = "us-east-1"
}

variable "ami_id" {
  description = "value of the ami of instance"
}

variable "instance_type" {
  description = "type of instance"
}

resource "aws_instance" "server" {
  ami = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = terraform.workspace
  }
}