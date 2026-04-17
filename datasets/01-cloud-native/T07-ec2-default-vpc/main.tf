# T07 (EC2): Uso da VPC Padrão. A instância não especifica uma sub-rede customizada, caindo na VPC default. 
# Intenção: Proibir deploy na VPC padrão por questões de isolamento.

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web_server" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  
  tags = {
    Name = "T07_Vulnerable_EC2"
  }
}