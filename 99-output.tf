output "s3_bucket_name" {
  description = "The name for the created S3 bucket."
  value       = aws_s3_bucket.website.id
}

output "s3_bucket_arn" {
  description = "The arn for the created S3 bucket."
  value       = aws_s3_bucket.website.arn
}

output "cloudfront_url" {
  description = "The URL for the newly created CloudFront Distribution."
  value       = "https://${aws_cloudfront_distribution.website.domain_name}"
}

output "cloudfront_error_url" {
  description = "The URL for the newly created CloudFront Distribution."
  value       = "https://${aws_cloudfront_distribution.website.domain_name}/${var.s3-objects["error"].key}"
}
