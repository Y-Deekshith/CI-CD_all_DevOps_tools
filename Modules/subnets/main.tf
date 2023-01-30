resource "aws_subnet" "public_subnets" {
  count = length(var.azs)
  vpc_id     = var.vpc_id
  cidr_block = element(var.public_cidr_block, count.index)

  tags = {
    Name = "${var.name}-subnet${count.index + 1}"
    Env  = "${var.env}-env"
  }
}