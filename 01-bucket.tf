resource "aws_s3_bucket" "website" {
  bucket_prefix = "samba-saturday-151225"
  force_destroy = true

  tags = {
    Name = "Bucket that will host website and files to be used in cloudfront distribution."
  }
}
