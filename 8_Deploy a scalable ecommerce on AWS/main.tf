provider "aws" {
  region = "us-east-2"
}

resource "aws_vpc" "djvpc" {
  cidr_block = "15.0.0.0/16"
}

resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.djvpc.id
  cidr_block        = "15.0.1.0/24"
  map_public_ip_on_launch = true
}

resource "aws_security_group" "ec2_sg" {
  vpc_id      = aws_vpc.main.id
  
  
  
  tags = {
    Name = "ec2_sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "example" {
  security_group_id = aws_security_group.example.id

  cidr_ipv4   = "10.0.0.0/8"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
}

resource "aws_vpc_security_group_egress_rule" "example" {
  security_group_id = aws_security_group.example.id

  cidr_ipv4   = "10.0.0.0/8"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
}


