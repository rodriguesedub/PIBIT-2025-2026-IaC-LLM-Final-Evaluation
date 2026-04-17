# T05 (EC2): Volume EBS Não Criptografado. O volume raiz não define encrypted = true. 
# Intenção: Exigir criptografia em todos os volumes atrelados à instância.

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  root_block_device {
    volume_size           = 20
    volume_type           = "gp2"
    encrypted             = false
    delete_on_termination = true
  }
}