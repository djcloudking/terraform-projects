provider "aws" {
    region = "us-west-2"
}

module "ec2_instance" {
    source = ".modules/ec2" # Define variables specific to this instance
    ami = "ami-0aff18ec83b712f05" # Replace with a valid AMI ID
    instance_type = "t2.micro"
}