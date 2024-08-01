variable "ami_value" {
    description = "value of AMI"
}

variable "instance_type_value" {
    description = "value of instance type"
}

provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "dj_instance" {
    ami = var.ami_value
    instance_type = var.instance_type_value
}