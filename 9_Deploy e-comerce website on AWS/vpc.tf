# create  VPC

resource "aws_vpc" "djvpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "dev vpc"
  }
}