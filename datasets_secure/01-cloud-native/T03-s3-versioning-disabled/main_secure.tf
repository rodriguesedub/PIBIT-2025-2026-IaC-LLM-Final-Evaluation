resource "aws_s3_bucket" "test_bucket" {
  bucket = "iac-secbench-t03-bucket"
}

resource "aws_s3_bucket_versioning" "test_bucket_versioning" {
  bucket = aws_s3_bucket.test_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}