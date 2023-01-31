resource "aws_launch_configuration" "launchconfig" {
  name_prefix                 = "${var.name}-asglc"
  image_id                    = var.ami
  instance_type               = var.instance_type
  key_name                    = var.key_name
  security_groups             = var.sg_ids
  associate_public_ip_address = true
  #   user_data = "${file("data_add.sh")}"
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "asg" {
  name             = "${var.name}-asg"
  max_size         = 4
  min_size         = 2
  desired_capacity = 2
#   load_balancers   = var.alb

  launch_configuration = aws_launch_configuration.launchconfig.name

  vpc_zone_identifier = var.public_subnets

  lifecycle {
    create_before_destroy = true
  }
  tag {
    key                 = "Name"
    value               = "asg"
    propagate_at_launch = true
  }
}