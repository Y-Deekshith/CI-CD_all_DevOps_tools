output "public_subnet_id" {
  value = aws_subnet.public_subnets.*.id
}
output "public_subnet_1" {
  value = aws_subnet.public_subnets.0.id
}

output "private_subnet_id" {
  value = aws_subnet.private_subnets.*.id
}