provider "aws" {
  region = "us-east-1" # Specify your desired AWS region
  profile = "djadmin-general"
}

# Define instance variables
variable "instance_type" {
  default = "t2.micro" # Instance type
}

variable "ami_id" {
  default = "ami-063d43db0594b521b" # Replace with a valid AMI ID in your region
}

# Define instance configurations in a map
variable "instances" {
  type = map(object({
    name        = string
    environment = string
  }))
  default = {
    dev1   = { name = "Dev 1",   environment = "Development" }
    dev2   = { name = "Dev 2",   environment = "Development" }
    stage1 = { name = "Stage 1", environment = "Staging" }
    stage2 = { name = "Stage 2", environment = "Staging" }
    prod1  = { name = "Prod 1",  environment = "Production" }
    prod2  = { name = "Prod 2",  environment = "Production" }
    test1  = { name = "Test 1",  environment = "Testing" }
    test2  = { name = "Test 2",  environment = "Testing" }
  }
}

# Deploy EC2 instances using a loop
resource "aws_instance" "web_server" {
  for_each      = var.instances
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name        = each.value.name
    Environment = each.value.environment
  }
}