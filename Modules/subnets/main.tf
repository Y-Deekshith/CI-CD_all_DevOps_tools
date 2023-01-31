resource "aws_subnet" "public_subnets" {
  count             = length(var.public_cidr_block)
  vpc_id            = var.vpc_id
  cidr_block        = element(var.public_cidr_block, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name = "${var.name}-publicsubnet${count.index + 1}"
    Env  = "${var.env}-env"
  }
}

resource "aws_subnet" "private_subnets" {
  count             = length(var.private_cidr_block)
  vpc_id            = var.vpc_id
  cidr_block        = element(var.private_cidr_block, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name = "${var.name}-privatesubnet${count.index + 1}"
    Env  = "${var.env}-env"
  }
}

resource "aws_route_table_association" "publicroute" {
  count          = length(var.public_cidr_block)
  subnet_id      = element(aws_subnet.public_subnets.*.id, count.index)
  route_table_id = var.mrtb
}
resource "aws_route_table_association" "privateroute" {
  count          = length(var.private_cidr_block)
  subnet_id      = element(aws_subnet.private_subnets.*.id, count.index)
  route_table_id = var.crtb
}