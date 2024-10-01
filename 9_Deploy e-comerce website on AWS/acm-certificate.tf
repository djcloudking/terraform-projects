# Create ACM certificate
resource "aws_acm_certificate" "ssl_certificate" {
  domain_name       = "www.djinthecloud.com"
  validation_method = "DNS"

  tags = {
    Name = "acm-cert"
  }
}