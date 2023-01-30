resource "aws_vpc" "mainvpc" {
  cidr_block       = var.cidr_block
  instance_tenancy = var.instance_tenancy

  tags = {
    Name = "${var.name}-Vpc"
    Env  = "${var.env}-env"
  }
}