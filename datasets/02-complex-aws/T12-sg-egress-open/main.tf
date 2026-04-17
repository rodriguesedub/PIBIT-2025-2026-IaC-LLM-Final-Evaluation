# T12 (Security Group): Egress Totalmente Aberto. Regra de saída genérica (from_port=0, to_port=0, protocolo -1). 
# Intenção: Exigir tráfego de saída restrito (Egress Filtering).

resource "aws_security_group" "t12_open_egress" {
  name        = "t12-open-egress"
  description = "Security Group for T12 benchmark"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}