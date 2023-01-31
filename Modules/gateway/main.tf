resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id

  tags = {
    Name = "${var.name}-igw"
  }
}
resource "aws_eip" "elasticip" {
  tags = {
    Name = "${var.name}-EIP"
  }
}
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.elasticip.id
  subnet_id     = var.publicsubnet_1

  tags = {
    Name = "${var.name}-natgw"
  }
  
  depends_on = [aws_internet_gateway.igw]
}