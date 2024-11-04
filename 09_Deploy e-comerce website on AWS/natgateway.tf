# Create NAT Gateway

# Allocate eip in az1
resource "aws_eip" "eip_natgateway_az1" {
    domain = "vpc"

    tags = {
      Name = "eip nat gateway az1"
    }  
}

# Allocate eip in az2
resource "aws_eip" "eip_natgateway_az2" {
    domain = "vpc"

    tags = {
      Name = "eip nat gateway az2"
    }  
}

# Create NAT gateway in public subnet AZ1
resource "aws_nat_gateway" "dj_natgw_az1" {
  allocation_id = aws_eip.eip_natgateway_az1.id
  subnet_id     = aws_subnet.public_subnet_az1.id

  tags = {
    Name = "Nat gateway az1"
  }

  depends_on = [aws_internet_gateway.djgw]
}

# Create NAT gateway in public subnet AZ2
resource "aws_nat_gateway" "dj_natgw_az2" {
  allocation_id = aws_eip.eip_natgateway_az2.id
  subnet_id     = aws_subnet.public_subnet_az2.id

  tags = {
    Name = "Nat gateway az2"
  }

  depends_on = [aws_internet_gateway.djgw]
}

# Create private route table az1 and route through nat gateway
resource "aws_route_table" "private_route_table_az1" {
    vpc_id = aws_vpc.djvpc.id
    
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.dj_natgw_az1.id
  }

  tags = {
    Name = "private route table az1"
  }
}

# Associate private app subnet az1 to private route table az1
resource "aws_route_table_association" "private_app_subnet_az1_route_table_az1_association" {
    subnet_id = aws_subnet.private_app_subnet_az1.id
    route_table_id = aws_route_table.private_route_table_az1.id
}

# Associate private data subnet az1 to private route table az1
resource "aws_route_table_association" "private_data_subnet_az1_route_table_az1_association" {
    subnet_id = aws_subnet.private_app_subnet_az1.id
    route_table_id = aws_route_table.private_route_table_az1.id 
}

# Create private route table az2 and add route through nat gateway Az2
 resource "aws_route_table" "private_app_route_table_az2" {
    vpc_id = aws_vpc.djvpc.id
    
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.dj_natgw_az2.id
  }

  tags = {
    Name = "private route table az2"
  }
}

# Associate private app subnet az2 to private route table az2
resource "aws_route_table_association" "private_app_subnet_az2_route_table_az2_association" {
    subnet_id = aws_subnet.private_app_subnet_az2.id
    route_table_id = aws_route_table.private_app_route_table_az2.id 
}

# Associate private data subnet az2 to private route table az2
resource "aws_route_table_association" "private_data_subnet_az2_route_table_az2_association" {
    subnet_id = aws_subnet.private_data_subnet_az2.id
    route_table_id = aws_route_table.private_app_route_table_az2.id 
}
