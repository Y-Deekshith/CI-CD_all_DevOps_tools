resource "aws_subnet" "public_subnets" {
  count             = length(var.public_cidr_block)
  vpc_id            = var.vpc_id
  cidr_block        = element(var.public_cidr_block, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name = "${var.name}-subnet${count.index + 1}"
    Env  = "${var.env}-env"
  }
}

resource "aws_subnet" "private_subnets" {
  count             = length(var.private_cidr_block)
  vpc_id            = var.vpc_id
  cidr_block        = element(var.private_cidr_block, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name = "${var.name}-subnet${count.index + 1}"
    Env  = "${var.env}-env"
  }
}