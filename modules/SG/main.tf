provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "sg" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = var.vpc_id

  tags = {
    Name = "my-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ingress-http" {
  security_group_id = aws_security_group.sg.id
  cidr_ipv4         = "0.0.0.0/0"
  description       = "http"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80

  tags = {
    Name = "HTTP"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ingress-ssh" {
  security_group_id = aws_security_group.sg.id
  cidr_ipv4         = "0.0.0.0/0"
  description       = "ssh"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22

  tags = {
    Name = "SSH"
  }
}

resource "aws_vpc_security_group_egress_rule" "egress-rules" {
  security_group_id = aws_security_group.sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
