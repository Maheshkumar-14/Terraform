variable "ami_id" {
  description = "value"
}

variable "instance_type" {
  description = "value"
  type        = map(string)

  default = {
    "dev"     = "t3.micro"
    "staging" = "t2.micro"
    "prod"    = "t2.medium"
  }
}
module "ec2" {
  source        = "./module/ec2"
  ami_id        = var.ami_id
  instance_type = lookup(var.instance_type, terraform.workspace, "t3.micro")
}
