resource "aws_db_option_group" "mariadb_options_t27" {
  name                 = "mariadb-options-t27"
  engine_name          = "mariadb"
  major_engine_version = "10.6"

  option {
    option_name = "MARIADB_AUDIT_PLUGIN"

    option_settings {
      name  = "SERVER_AUDIT_EVENTS"
      value = "CONNECT,QUERY"
    }
  }
}

resource "aws_db_instance" "mariadb_t27" {
  identifier                      = "mariadb-t27"
  engine                          = "mariadb"
  engine_version                  = "10.6"
  instance_class                  = "db.t3.micro"
  allocated_storage               = 20
  username                        = "admin"
  password                        = "Password123!"
  option_group_name               = aws_db_option_group.mariadb_options_t27.name
  skip_final_snapshot             = true
  enabled_cloudwatch_logs_exports = ["audit"]
}