## VPC

resource "aws_vpc" "vpc" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = var.instance_tenancy
  tags = var.default_tags
}

## Subnet

resource "aws_subnet" "subnets" {
  count = length(var.subnet_cidr_block)
  vpc_id     = aws_vpc.vpc.id
  availability_zone = var.subnet_availability_zone[count.index]
  cidr_block = var.subnet_cidr_block[count.index]
  tags = var.default_tags
}

## IGW

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = var.default_tags
}

## RT

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc.id
  tags = var.default_tags
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.vpc.id
  tags = var.default_tags
}

## Association

resource "aws_route_table_association" "subnet1" {
  subnet_id      = aws_subnet.subnets[0].id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "subnet2" {
  subnet_id      = aws_subnet.subnets[1].id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "b" {
  gateway_id     = aws_internet_gateway.igw.id
  route_table_id = aws_route_table.public_rt.id
}