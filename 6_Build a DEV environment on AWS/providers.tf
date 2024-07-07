terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"   
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  shared_config_files      = ["/Users/tf_user/.aws/config"]
  shared_credentials_files = ["/Users/tf_user/.aws/credentials"]
  profile                  = "djdev"
}