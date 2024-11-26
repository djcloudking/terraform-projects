resource "aws_s3_bucket" "general-payroll-data" {
    bucket = "${var.app_region}-${var.bucket}" 
}