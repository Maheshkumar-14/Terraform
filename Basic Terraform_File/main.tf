provider "aws" {
    alias = "Mumbai"
    region = "ap-south-1"
}

provider "aws" {
    alias = "Oregon"
    region = "us-west-2"
}

resource "aws_instance" "example" {
    provider = aws.Mumbai
    ami = "ami-01a00762f46d584a1"
    instance_type = "t3.micro"
    
}

resource "aws_s3_bucket" "example" {
    provider = aws.Oregon
    bucket   = "nukala-mahesh-kumar"
}