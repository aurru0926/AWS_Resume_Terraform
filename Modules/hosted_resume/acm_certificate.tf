resource "aws_acm_certificate" "acm_cert" {
  domain_name = var.domain_name

  options {
    certificate_transparency_logging_preference = "ENABLED"
  }

  validation_method = "DNS"
}
