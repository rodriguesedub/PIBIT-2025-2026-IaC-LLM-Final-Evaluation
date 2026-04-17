# T03 (S3): Versionamento Desativado. O recurso aws_s3_bucket_versioning está ausente ou com estado "Suspended".
#  Intenção: Prevenir perda de dados por deleção acidental exigindo "Enabled".

resource "aws_s3_bucket" "test_bucket" {
  bucket = "iac-secbench-t03-bucket"
}

resource "aws_s3_bucket_versioning" "test_bucket_versioning" {
  bucket = aws_s3_bucket.test_bucket.id

  versioning_configuration {
    status = "Suspended"
  }
}