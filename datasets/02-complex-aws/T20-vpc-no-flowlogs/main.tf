# T20 (VPC): Flow Logs Desativados. 
# Criação de VPC sem associação a um recurso aws_flow_log. 
# Intenção: Garantir a rastreabilidade e auditoria de tráfego de rede.

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

resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "t20-vpc-no-flow-logs"
  }
}