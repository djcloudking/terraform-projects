provider "aws" {
  region = "us-east-1"
  profile = "djadmin-general"
}

terraform {
  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.14.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.10.1"
    }
  }

  required_version = ">= 1.0, < 2.0"
}
