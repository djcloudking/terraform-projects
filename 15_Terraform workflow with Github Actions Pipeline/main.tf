terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

# Uncomment everything above if you want a remote state backend
  # Backend Configuration (Optional for Remote State)
  # backend "s3" {
  #  bucket         = "my-terraform-state-bucket"
  #  key            = "terraform/workflow/terraform.tfstate"
  # region         = "us-east-1"
  #  dynamodb_table = "terraform-lock-table"
  #  encrypt        = true
  #}
#}


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
