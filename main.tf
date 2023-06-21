resource "aws_kms_key" "example" {
  description = "Example KMS Key"
}

resource "aws_db_instance" "default" {
  allocated_storage             = 10
  db_name                       = "mydb"
  engine                        = "mysql"
  engine_version                = "5.7"
  instance_class                = "db.t2.micro"
  manage_master_user_password   = true
  master_user_secret_kms_key_id = aws_kms_key.example.key_id
  username                      = "foo"
  parameter_group_name          = "default.mysql5.7"
  skip_final_snapshot  = true
}
output "kms_key" {
	value = aws_kms_key.example.key_id
}
