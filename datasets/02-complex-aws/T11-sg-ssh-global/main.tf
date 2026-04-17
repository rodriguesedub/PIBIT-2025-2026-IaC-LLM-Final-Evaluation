# T11 (Security Group): Ingress SSH Global. Regra de entrada permitindo porta 22 para 0.0.0.0/0. 
# Intenção: Bloquear administração remota aberta para a internet.

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

resource "aws_security_group" "allow_ssh_global" {
  name        = "allow_ssh_global"
  description = "Security group for T11 test"

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}