terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
}

provider "aws" {
  region = var.region
}

resource "aws_instance" "dj_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "DjInstance"
  }
}
}

