# Create ACM certificate
resource "aws_acm_certificate" "ssl_certificate" {
  domain_name       = "www.talybo.com"
  validation_method = "DNS"

  tags = {
    Name = "acm-cert"
  }
}