# T16 (IAM User): Chaves de Acesso Hardcoded. 
# Tentativa de criar aws_iam_access_key diretamente no IaC. 
# Intenção: Bloquear a geração de chaves estáticas, 
# forçando a adoção de STS ou perfis baseados em roles.

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

resource "aws_iam_user" "t16_user" {
  name = "t16-static-user"
}

resource "aws_iam_access_key" "t16_user_key" {
  user = aws_iam_user.t16_user.name
}