output "igw_id" {
  value = aws_internet_gateway.igw.id
}

output "natgw_id" {
  value = aws_nat_gateway.nat_gw.id
}

output "elastic_ip" {
  value = aws_eip.elasticip.id
}

