resource "aws_cloudfront_cache_policy" "cf_cache_policy_1" {
  comment     = "Policy for Elemental MediaPackage Origin"
  default_ttl = "86400"
  max_ttl     = "31536000"
  min_ttl     = "0"
  name        = "Managed-Elemental-MediaPackage"

  parameters_in_cache_key_and_forwarded_to_origin {
    cookies_config {
      cookie_behavior = "none"
    }

    enable_accept_encoding_brotli = "false"
    enable_accept_encoding_gzip   = "true"

    headers_config {
      header_behavior = "whitelist"

      headers {
        items = ["origin"]
      }
    }

    query_strings_config {
      query_string_behavior = "whitelist"

      query_strings {
        items = ["aws.manifestfilter", "end", "m", "start"]
      }
    }
  }
}

resource "aws_cloudfront_cache_policy" "cf_cache_policy_2" {
  comment     = "Policy for Amplify Origin"
  default_ttl = "2"
  max_ttl     = "600"
  min_ttl     = "2"
  name        = "Managed-Amplify"

  parameters_in_cache_key_and_forwarded_to_origin {
    cookies_config {
      cookie_behavior = "all"
    }

    enable_accept_encoding_brotli = "true"
    enable_accept_encoding_gzip   = "true"

    headers_config {
      header_behavior = "whitelist"

      headers {
        items = ["Authorization", "CloudFront-Viewer-Country", "Host"]
      }
    }

    query_strings_config {
      query_string_behavior = "all"
    }
  }
}

resource "aws_cloudfront_cache_policy" "cf_cache_policy_3" {
  comment     = "Policy with caching disabled"
  default_ttl = "0"
  max_ttl     = "0"
  min_ttl     = "0"
  name        = "Managed-CachingDisabled"

  parameters_in_cache_key_and_forwarded_to_origin {
    cookies_config {
      cookie_behavior = "none"
    }

    enable_accept_encoding_brotli = "false"
    enable_accept_encoding_gzip   = "false"

    headers_config {
      header_behavior = "none"
    }

    query_strings_config {
      query_string_behavior = "none"
    }
  }
}

resource "aws_cloudfront_cache_policy" "cf_cache_policy_4" {
  comment     = "Policy with caching enabled. Supports Gzip and Brotli compression."
  default_ttl = "86400"
  max_ttl     = "31536000"
  min_ttl     = "1"
  name        = "Managed-CachingOptimized"

  parameters_in_cache_key_and_forwarded_to_origin {
    cookies_config {
      cookie_behavior = "none"
    }

    enable_accept_encoding_brotli = "true"
    enable_accept_encoding_gzip   = "true"

    headers_config {
      header_behavior = "none"
    }

    query_strings_config {
      query_string_behavior = "none"
    }
  }
}

resource "aws_cloudfront_cache_policy" "cf_cache_policy_5" {
  comment     = "Default policy when compression is disabled"
  default_ttl = "86400"
  max_ttl     = "31536000"
  min_ttl     = "1"
  name        = "Managed-CachingOptimizedForUncompressedObjects"

  parameters_in_cache_key_and_forwarded_to_origin {
    cookies_config {
      cookie_behavior = "none"
    }

    enable_accept_encoding_brotli = "false"
    enable_accept_encoding_gzip   = "false"

    headers_config {
      header_behavior = "none"
    }

    query_strings_config {
      query_string_behavior = "none"
    }
  }
}
