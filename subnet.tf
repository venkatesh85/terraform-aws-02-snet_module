# ---------Public Subnet Module---------
resource "aws_subnet" "public_subnet" {
  count                   = length(local.public_subnet_cidrs)
  vpc_id                  = var.vpc_id
  cidr_block              = element(local.public_subnet_cidrs, count.index)
  availability_zone       = element(local.azs, count.index)
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.vpc_name}-public-subnet-${count.index + 1}"
  }
}

# ---------Private Subnet Module---------
resource "aws_subnet" "private_subnet" {
  count                   = length(local.private_subnet_cidrs)
  vpc_id                  = var.vpc_id
  cidr_block              = element(local.private_subnet_cidrs, count.index)
  availability_zone       = element(local.azs, count.index)
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.vpc_name}-private-subnet-${count.index + 1}"
  }
}

# ---------Full Private Subnet Module---------
resource "aws_subnet" "private_full_subnet" {
  count                   = length(local.private_full_subnet_cidrs)
  vpc_id                  = var.vpc_id
  cidr_block              = element(local.private_full_subnet_cidrs, count.index)
  availability_zone       = element(local.azs, count.index)
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.vpc_name}-full-private-subnet-${count.index + 1}"
  }
}

# ---------Elasic IP for NAT Gateway---------
resource "aws_eip" "nat" {
  domain = "vpc"

  tags = {
    Name = "${var.vpc_name}-nat-eip"
  } 
}       

# ---------NAT Gateway---------
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_subnet[0].id

  tags = {
    Name = "${var.vpc_name}-nat-gateway"
  }
}