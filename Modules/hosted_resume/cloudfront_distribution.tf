resource "aws_cloudfront_distribution" "cf_distribution" {
  aliases = [var.web_url]

  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD"]
    cache_policy_id        = "${aws_cloudfront_cache_policy.cf_cache_policy_4.id}"
    cached_methods         = ["GET", "HEAD"]
    compress               = "true"
    default_ttl            = "0"
    max_ttl                = "0"
    min_ttl                = "0"
    smooth_streaming       = "false"
    target_origin_id       = aws_s3_bucket.bucket.bucket_domain_name
    viewer_protocol_policy = "redirect-to-https"
  }

  default_root_object = "index.html"
  enabled             = "true"
  http_version        = "http2"
  is_ipv6_enabled     = "true"

  origin {
    connection_attempts = "3"
    connection_timeout  = "10"

    custom_origin_config {
      http_port                = "80"
      https_port               = "443"
      origin_keepalive_timeout = "5"
      origin_protocol_policy   = "http-only"
      origin_read_timeout      = "30"
      origin_ssl_protocols     = ["SSLv3", "TLSv1", "TLSv1.1", "TLSv1.2"]
    }

    domain_name = aws_s3_bucket.bucket.bucket_domain_name
    origin_id   = aws_s3_bucket.bucket.bucket_domain_name
  }

  price_class = "PriceClass_All"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  retain_on_delete = "false"

  viewer_certificate {
    acm_certificate_arn            = aws_acm_certificate.acm_cert.arn
    cloudfront_default_certificate = "false"
    minimum_protocol_version       = "TLSv1.2_2021"
    ssl_support_method             = "sni-only"
  }
}
