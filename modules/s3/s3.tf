resource "aws_s3_bucket" "this" {
  bucket  = "${var.logs_bucket_name}-${var.environment}"
  tags    = var.tags
}

resource "aws_s3_bucket_lifecycle_configuration" "this" {
  bucket = aws_s3_bucket.this.bucket
  rule {
    id     = "auto-clean"
    status = "Enabled"
    expiration {
      days = 100
    }
  }
}