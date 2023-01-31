output "asg_id" {
  value = aws_autoscaling_group.asg.id
}

output "asg_arn" {
  value = aws_autoscaling_group.asg.arn
}

output "asg_lc" {
  value = aws_launch_configuration.launchconfig.id
}