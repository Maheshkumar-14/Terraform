terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "basic_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
}

resource "aws_s3_bucket" "sample_bucket" {
  bucket = var.bucket_name
}