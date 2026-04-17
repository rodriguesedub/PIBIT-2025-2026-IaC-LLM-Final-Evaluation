# T04 (EC2): IP Público Associado. A instância define associate_public_ip_address = true. 
# Intenção: Proibir instâncias de terem IPs públicos diretos, forçando uso de Bastion ou SSM.

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami                         = "ami-0c55b159cbfafe1f0"
  instance_type               = "t2.micro"
  associate_public_ip_address = true

  tags = {
    Name = "T04-Public-Instance"
  }
}