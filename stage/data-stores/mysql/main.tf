provider "aws" {
  region = "us-east-2"
  profile = "james"
}

resource "aws_db_instance" "example" {
  identifier_prefix = "terraform-up-and-running"
  engine = "mysql"
  allocated_storage = 10
  instance_class = "db.t2.micro"
  name = "example_database"
  username = "admin"
  password = jsondecode(data.aws_secretsmanager_secret_version.db_password_store.secret_string)["password"]
  skip_final_snapshot = true
  apply_immediately = true
}

data "aws_secretsmanager_secret_version" "db_password_store" {
  secret_id = "mysql-master-password-stage"
}
