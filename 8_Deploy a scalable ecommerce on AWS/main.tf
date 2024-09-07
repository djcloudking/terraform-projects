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

