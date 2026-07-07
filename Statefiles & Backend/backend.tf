terraform {
  backend "s3" {
    bucket = "terraform-statefile-mahesh-bucket"
    region = "us-east-1"
    key = "Mahesh/terraform.tfstate"
  }
}