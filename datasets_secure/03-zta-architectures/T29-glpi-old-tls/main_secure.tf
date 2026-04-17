provider "aws" {
  region                      = "us-east-1"
  access_key                  = "mock"
  secret_key                  = "mock"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
}

variable "glpi_alb_arn" {
  type    = string
  default = "arn:aws:elasticloadbalancing:us-east-1:123456789012:loadbalancer/app/glpi/1234567890123456"
}

variable "glpi_certificate_arn" {
  type    = string
  default = "arn:aws:acm:us-east-1:123456789012:certificate/12345678-1234-1234-1234-123456789012"
}

variable "glpi_target_group_arn" {
  type    = string
  default = "arn:aws:elasticloadbalancing:us-east-1:123456789012:targetgroup/glpi-tg/1234567890123456"
}

resource "aws_lb_listener" "glpi_https" {
  load_balancer_arn = var.glpi_alb_arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-2017-01"
  certificate_arn   = var.glpi_certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = var.glpi_target_group_arn
  }
}