resource "aws_s3_bucket_policy" "bucketpolicy" {
  bucket = aws_s3_bucket.bucket.id
  policy = "{\"Statement\":[{\"Action\":\"s3:GetObject\",\"Effect\":\"Allow\",\"Principal\":\"*\",\"Resource\":\"arn:aws:s3:::alejandrouaws.com/*\",\"Sid\":\"PublicReadGetObject\"}],\"Version\":\"2012-10-17\"}"
}
