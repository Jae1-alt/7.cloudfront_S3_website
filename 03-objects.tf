resource "aws_s3_object" "index" {
  for_each = var.s3-objects

  bucket       = aws_s3_bucket.website.bucket
  key          = each.value.key
  source       = each.value.source
  content_type = each.value.content_type

  etag = filemd5(each.value.source)
}
