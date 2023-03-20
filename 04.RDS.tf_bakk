resource "aws_db_subnet_group" "database_subnet_group" {
  name         = "database subnets"
  subnet_ids   = [aws_subnet.private_db_subnet_az1.id, aws_subnet.private_db_subnet_az2.id]
  description  = "subnets for database instance"

  tags   = {
    Name = "DB Subnets"
  }
}


# create database instance restored from db snapshots
# terraform aws db instance
resource "aws_db_instance" "database_instance" {
  engine = "mysql"
  engine_version = "8.0.31"
  multi_az = false
  identifier = "web01-rds"
  username = "opi"
  password = "Abc123opi"
  instance_class = "db.t2.micro"
  allocated_storage = 30
  db_subnet_group_name = aws_db_subnet_group.database_subnet_group.name
  vpc_security_group_ids = [aws_security_group.database_security_group.id]
  availability_zone = "ap-southeast-1b"
  db_name = "ecommerce01"
  skip_final_snapshot = true
}