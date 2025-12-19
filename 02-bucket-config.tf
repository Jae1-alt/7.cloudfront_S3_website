resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.website.id

  block_public_acls  = true
  ignore_public_acls = true

  block_public_policy     = false
  restrict_public_buckets = false
}


resource "aws_s3_bucket_policy" "cloudfront_access" {
  bucket = aws_s3_bucket.website.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowCFaccess"
        Effect = "Allow"
        Principal = {
          Service = "cloudfront.amazonaws.com"
        }
        Action   = "s3:GetObject"
        Resource = "${aws_s3_bucket.website.arn}/*"
        Condition = {
          StringEquals = {
            "AWS:SourceArn" = "${aws_cloudfront_distribution.website.arn}"
          }
        }
      }
    ]
  })
  # add this explict dependency, dependency chain issues occur intermittenly 
  depends_on = [aws_s3_bucket_public_access_block.public_access]
}
