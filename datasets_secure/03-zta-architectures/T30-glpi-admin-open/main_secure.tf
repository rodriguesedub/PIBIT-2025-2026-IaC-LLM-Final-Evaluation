provider "aws" {
  region                      = "us-east-1"
  access_key                  = "test"
  secret_key                  = "test"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
}

variable "vpc_id" {
  type    = string
  default = "vpc-12345678"
}

resource "aws_security_group" "glpi_admin_access" {
  name        = "glpi-admin-sg"
  description = "Allow administrative access to GLPI panel"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "glpi_server" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t3.medium"
  vpc_security_group_ids = [aws_security_group.glpi_admin_access.id]

  tags = {
    Name = "GLPI-Server-ZTA-Test"
  }
}