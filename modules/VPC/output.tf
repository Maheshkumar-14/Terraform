output "vpc_id" {
  value = aws_vpc.My_vpc.id
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "route_table_id" {
  value = aws_route_table.route_table.id
}

