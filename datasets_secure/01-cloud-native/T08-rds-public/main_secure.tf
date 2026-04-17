resource "aws_db_instance" "vulnerable_rds" {
  identifier          = "secbench-t08-rds"
  allocated_storage   = 20
  engine              = "mysql"
  engine_version      = "8.0"
  instance_class      = "db.t3.micro"
  username            = "admin"
  password            = "admin12345"
  skip_final_snapshot = true
  
  publicly_accessible = false
}