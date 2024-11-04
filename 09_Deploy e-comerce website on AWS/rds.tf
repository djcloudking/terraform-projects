# create database subnet group
# terraform aws db subnet group
resource "aws_db_subnet_group" "database_subnet_group" {
  name        = "database subnets"
  subnet_ids  = [aws_subnet.private_data_subnet_az1.id, aws_subnet.private_data_subnet_az2.id]
  description = "subnets for database instance"

  tags = {
    Name = "database subnets"
  }
}

# create database instance
resource "aws_db_instance" "database_instance" {
  availability_zone      = "us-east-1e"
  allocated_storage      = 10
  identifier             = "dev-rds-db"
  engine                 = "mysql"
  engine_version         = "8.0.37"
  instance_class         = "db.t3.micro"
  username               = "djkone" # choose one
  password               = "djkone2020" # choose one
  db_subnet_group_name   = aws_db_subnet_group.database_subnet_group.name
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.database_sg.id]
}