resource "aws_security_group" "t12_open_egress" {
  name        = "t12-open-egress"
  description = "Security Group for T12 benchmark"

  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }
}