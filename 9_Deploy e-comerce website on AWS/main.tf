# Configure AWS provider
provider "AWS" {
    region = "us-east-1"
    profile = "djadmin-general"
}

# Store Terraform state file in S3
terraform {
  backend "s3" {
    bucket = "terraform-ecom"
    key = "build/terraform.tfstate.dev"
    region = "us-east-1"
    profile = "djadmin-general"
  }
}