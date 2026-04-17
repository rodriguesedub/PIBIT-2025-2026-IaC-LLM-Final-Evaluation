# T28 (GLPI via IaC): Implantação Sem WAF. 
# Servidor Web (Apache/Nginx) provisionado sem Web Application Firewall (ex: ModSecurity).
# Intenção: Exigir a presença de módulos de proteção layer 7.

resource "aws_instance" "glpi_server" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t3.medium"

  tags = {
    Name = "GLPI-Server-T28"
  }
}

resource "aws_security_group" "allow_http" {
  name        = "allow_http_glpi"
  description = "Permitir trafego HTTP direto ao servidor"

  ingress {
    from_port   = 80
    to_port     = 80
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

