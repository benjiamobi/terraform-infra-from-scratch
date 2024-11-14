resource "aws_db_instance" "db" {
  engine = "mysql"
  engine_version = "8.0.33"
  instance_class = "db.t3.micro"
  allocated_storage = 10
  max_allocated_storage = 20
  storage_encrypted = true
  publicly_accessible = true
  db_name = "mydb"
  username = "admin"
  password = "password"
}
