# create  VPC
resource "aws_vpc" "djvpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "dev vpc"
  }
}

# Create Internet Gateway
resource "aws_internet_gateway" "djgw" {
  vpc_id = aws_vpc.djvpc.id

  tags = {
    Name = "Dev Internet Gateway"
  }
}

# Create Public Subnet az1
resource "aws_subnet" "public_subnet_az1" {
    vpc_id = aws_vpc.djvpc.id

    cidr_block = var.public_subnet_az1_cidr
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = true 

    tags = {
        Name = "public subnet az1"
    }  
}

# Create Public Subnet az2
resource "aws_subnet" "public_subnet_az2" {
    vpc_id = aws_vpc.djvpc.id

    cidr_block = var.public_subnet_az2_cidr
    availability_zone = "us-east-1b"
    map_public_ip_on_launch = true 

    tags = {
        Name = "public subnet az2"
    }   
}

# Create route table
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.djvpc.id

  route {
    cidr_block = "0.0.0.0/24"
    gateway_id = aws_internet_gateway.djgw.id
  }

  tags = {
    Name = "public route table"
  }
}

# Associate public subnet az1 to public route table 
resource "aws_route_table_association" "public_subnet_az1_route_table_association" {
    subnet_id = aws_subnet.public_subnet_az1.id
    route_table_id = aws_route_table.public_route_table.id
}

# Associate public subnet az2 to public route table 
resource "aws_route_table_association" "public_subnet_az2_route_table_association" {
    subnet_id = aws_subnet.public_subnet_az2.id
    route_table_id = aws_route_table.public_route_table.id
}

# Create Private app Subnet az1
resource "aws_subnet" "private_app_subnet_az1" {
    vpc_id = aws_vpc.djvpc.id

    cidr_block = var.private_subnet_az1_cidr
    availability_zone = "us-east-1c"
    map_public_ip_on_launch = false 

    tags = {
        Name = "private app subnet az1"
    }  
}

# Create PPrivate app Subnet az2
resource "aws_subnet" "private_app_subnet_az2" {
    vpc_id = aws_vpc.djvpc.id

    cidr_block = var.private_subnet_az2_cidr
    availability_zone = "us-east-1d"
    map_public_ip_on_launch = false 

    tags = {
        Name = "private app subnet az2"
    }   
}

# Create Private data Subnet az1
resource "aws_subnet" "private_data_subnet_az1" {
    vpc_id = aws_vpc.djvpc.id

    cidr_block = var.private_data_subnet_az1_cidr
    availability_zone = "us-east-1e"
    map_public_ip_on_launch = false 

    tags = {
        Name = "private app subnet az1"
    }  
}

# Create Private data Subnet az2
resource "aws_subnet" "private_data_subnet_az2" {
    vpc_id = aws_vpc.djvpc.id

    cidr_block = var.private_data_subnet_az2_cidr
    availability_zone = "us-east-1f"
    map_public_ip_on_launch = false 

    tags = {
        Name = "private data subnet az2"
    }   
}
