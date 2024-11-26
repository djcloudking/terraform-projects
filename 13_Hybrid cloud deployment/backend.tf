# Store Terraform state file in S3
terraform {
  backend "s3" {
    bucket = "dj-terraform-state-bucket"
    key = "s3/buckets/dj-terraform-state-bucket/terraform.tfstate"
    region = "us-east-2"
    dynamodb_table = "dj-dynamodb-state-locking"
  }
}

