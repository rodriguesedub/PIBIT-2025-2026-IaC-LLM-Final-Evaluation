# T19 (VPC/NACL): ACL de Rede Permissiva. 
# Regras Allow universais de entrada e saída na NACL. 
# Intenção: Exigir negação padrão explícita no fim da tabela de controle de acesso.

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_network_acl" "vulnerable_nacl" {
  vpc_id = aws_vpc.main.id

  ingress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  egress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
}