resource "aws_db_instance" "franchise_rds" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "postgres"
  engine_version       = "16.3"
  instance_class       = "db.t3.micro"
  db_name              = "franchisedb"
  username             = "test"
  password             = "franchise2025*"
  parameter_group_name = aws_db_parameter_group.franchise_rds_parameter_group.name
  skip_final_snapshot  = true
  publicly_accessible  = true
  multi_az             = false
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name = aws_db_subnet_group.franchise_rds_subnet_group.name
}

resource "aws_db_subnet_group" "franchise_rds_subnet_group" {
  name       = "franchise-rds-subnet-group"
  subnet_ids = [aws_subnet.subnet_a.id, aws_subnet.subnet_b.id]
}

resource "aws_db_parameter_group" "franchise_rds_parameter_group" {
  name        = "franchise-rds-parameter-group"
  family      = "postgres16"
  description = "Custom parameter group for franchise RDS"

  parameter {
    name  = "rds.force_ssl"
    value = "0"
  }
}