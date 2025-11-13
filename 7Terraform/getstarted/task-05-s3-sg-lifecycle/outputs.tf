output "bucket_name" {
  value = aws_s3_bucket.my-new-S3-bucket.bucket
}

output "security_group_id" {
  value = aws_security_group.sg_test.id
}
