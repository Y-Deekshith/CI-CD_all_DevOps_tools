output "security_group" {
  value = aws_security_group.sg.id
}
output "security_group_name" {
  value = aws_security_group.sg.name
}
