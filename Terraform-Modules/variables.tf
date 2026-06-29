variable "vpc_cidr" {
  description = "cidr range of the vpc"
  type        = string
}

variable "public_subnet_cidr" {
  description = "cidr block for public subnet"
}

variable "private_subnet_cidr" {
  description = "cidr block for private subnet"
}

variable "ami_id" {
  description = "value of the ami"
}

variable "instance_type" {
  description = "type of the instance"
}