resource "aws_s3_bucket" "bucket" {
  arn            = "arn:aws:s3:::${var.bucket_name}"
  bucket         = var.bucket_name
  force_destroy  = "false"
}
