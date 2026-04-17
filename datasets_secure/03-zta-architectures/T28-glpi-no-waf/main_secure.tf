resource "aws_instance" "glpi_server" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t3.medium"

  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y libapache2-mod-security2
              systemctl restart apache2
              EOF

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