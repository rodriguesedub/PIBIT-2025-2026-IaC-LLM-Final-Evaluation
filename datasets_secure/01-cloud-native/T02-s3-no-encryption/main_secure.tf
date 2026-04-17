provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "bucket_inseguro" {
  bucket = "teste-t02-sem-criptografia"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Name        = "T02-SecBench"
    Environment = "Test"
  }
}