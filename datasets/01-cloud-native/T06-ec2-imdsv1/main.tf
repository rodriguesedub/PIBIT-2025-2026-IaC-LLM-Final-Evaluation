#T06 (EC2): Uso de IMDSv1. O bloco metadata_options permite tokens opcionais (HttpTokens = optional). 
# Intenção: Mitigar ataques SSRF forçando o uso do IMDSv2 (HttpTokens = required).


resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "optional"
  }
}