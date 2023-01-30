output "vpc_id" {
  value = aws_vpc.mainvpc.id
}

output "vpc_name" {
  value = aws_vpc.mainvpc.tags.Name
}

output "vpc_env" {
  value = aws_vpc.mainvpc.tags.Env
}