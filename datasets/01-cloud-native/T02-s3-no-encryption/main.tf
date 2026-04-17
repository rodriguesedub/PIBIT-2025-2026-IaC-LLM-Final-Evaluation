# T02 (S3): Ausência de Criptografia em Repouso. O bucket não possui o bloco server_side_encryption_configuration.
#  Intenção: Exigir criptografia SSE-S3 ou SSE-KMS.

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "bucket_inseguro" {
  bucket = "teste-t02-sem-criptografia"

  tags = {
    Name        = "T02-SecBench"
    Environment = "Test"
  }
}