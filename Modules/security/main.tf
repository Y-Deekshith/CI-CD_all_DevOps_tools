locals {
  inbound_ports = [22, 80, 443]
}

resource "aws_security_group" "sg" {
  name        = "${var.name}-sg"
  description = "terraform sg for modules"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = local.inbound_ports
    content {
    from_port   = ingress.value
    to_port     = ingress.value
    protocol    = "tcp"
    cidr_blocks = var.sg_cidr_blocks
  }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.sg_cidr_blocks
  }
}