provider "aws" {
    region = "us-west-2"
}

resource "aws_instance" "dj" {
    ami = var.ami_value
    instance_type = var.instance_type_value
}