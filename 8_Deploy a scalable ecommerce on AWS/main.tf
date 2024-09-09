# Define Provider
provider "aws" {
  region = "us-east-2"
}

# Define VPC & subnet
resource "aws_vpc" "djvpc" {
  cidr_block = "15.0.0.0/16"
}

resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.djvpc.id
  cidr_block        = "15.0.1.0/24"
  map_public_ip_on_launch = true
}

# Define security group
resource "aws_security_group" "djsg" {
  description = "Security group for for EC2, RDS, and ALB to Allow all inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.djvpc.id

  ingress = {
     from_port         = 80
     to_port           = 80 
     ip_protocol       = "tcp"
     cidr_block         = ["0.0.0.0/0"] # Allow from all
  }
 
  egress = {
     from_port         = 0
     to_port           = 0 
     ip_protocol       = "-1" # semantically equivalent to all ports
     cidr_block         = ["0.0.0.0/0"] 
  }
}


