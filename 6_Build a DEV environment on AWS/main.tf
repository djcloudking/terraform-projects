resource "aws_vpc" "dj_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "dev"
  }
}

resource "aws_subnet" "dj_public_subnet" {
  vpc_id                  = aws_vpc.dj_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = {
    Name = "dev-public"
  }
}

resource "aws_internet_gateway" "dj_internet_gateway" {
  vpc_id = aws_vpc.dj_vpc.id

  tags = {
    Name = "dev-igw"
  }
}

resource "aws_route_table" "dj_route_table" {
  vpc_id = aws_vpc.dj_vpc.id

  tags = {
    Name = "dev-rt"
  }
}

resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.dj_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.dj_internet_gateway.id
}

resource "aws_route_table_association" "dj_rta" {
  subnet_id      = aws_subnet.dj_public_subnet.id
  route_table_id = aws_route_table.dj_route_table.id
}

resource "aws_security_group" "dj_sg" {
  name        = "dev-sg"
  description = "dev security group"
  vpc_id      = aws_vpc.dj_vpc.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["73.136.44.55/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

