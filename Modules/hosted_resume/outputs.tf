output "s3_bucket_policy" {
  value = "${aws_s3_bucket_policy.bucketpolicy.id}"
}

output "s3_bucket" {
  value = "${aws_s3_bucket.bucket.id}"
}

output "aws_cloudfront_cache_policy_cf_cache_policy_1_id" {
  value = "${aws_cloudfront_cache_policy.cf_cache_policy_1.id}"
}

output "aws_cloudfront_cache_policy_cf_cache_policy_2_id" {
  value = "${aws_cloudfront_cache_policy.cf_cache_policy_2.id}"
}

output "aws_cloudfront_cache_policy_cf_cache_policy_3_id" {
  value = "${aws_cloudfront_cache_policy.cf_cache_policy_3.id}"
}

output "aws_cloudfront_cache_policy_cf_cache_policy_4_id" {
  value = "${aws_cloudfront_cache_policy.cf_cache_policy_4.id}"
}

output "aws_cloudfront_cache_policy_cf_cache_policy_5_id" {
  value = "${aws_cloudfront_cache_policy.cf_cache_policy_5.id}"
}

output "aws_cloudfront_distribution_cf_distribution_id" {
  value = "${aws_cloudfront_distribution.cf_distribution.id}"
}

output "aws_acm_certificate_acm_cert_id" {
  value = "${aws_acm_certificate.acm_cert.id}"
}
