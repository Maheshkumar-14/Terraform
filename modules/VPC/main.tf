provider "aws" {
  region = "us-east-1"
}


#VPC 
resource "aws_vpc" "My_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "terraform_vpc"
  }
}

#public subnet
resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.My_vpc.id
  cidr_block = var.public_subnet_cidr

  tags = {
    Name = "Public_subnet"
  }
}

#Private subnet
resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.My_vpc.id
  cidr_block = var.private_subnet_cidr

  tags = {
    Name = "Private_subnet"
  }
}
#Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.My_vpc.id

  tags = {
    Name = "vpc_igw"
  }
}

#Route Tables
resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.My_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "terraform_vpc_route_table"
  }
}
#Route Tables Assosiation
resource "aws_route_table_association" "rt_association" {

  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.route_table.id
}

