# T01 (S3): Acesso Público Habilitado. 
# O bucket omite ou configura block_public_acls = false. 
# Intenção: Garantir que o bloqueio de acesso público total (BPA) esteja ativo.

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "test_bucket_t01" {
  bucket = "iac-secbench-t01-public-bucket"
}

resource "aws_s3_bucket_public_access_block" "test_bucket_t01_bpa" {
  bucket = aws_s3_bucket.test_bucket_t01.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}