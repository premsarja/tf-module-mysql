resource "aws_db_instance" "mysql" {
  identifier           = "roboshop-${var.ENV}-mysql"
  allocated_storage    = 10
  db_name              = "b55"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = "prem"
  password             = "premsagar"
  parameter_group_name = aws_db_parameter_group.default.name
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.mysql.name
  vpc_security_group_ids = [aws_security_group.allow_mysql.id]
}


resource "aws_db_subnet_group" "mysql" {
  name       = "roboshop-${var.ENV}-mysql-subnet-group"
  subnet_ids = data.terraform_remote_state.vpc.outputs.PRIVATE_SUBNET_IDS[0]

  tags = {
    Name = "roboshop-${var.ENV}-mysql-subnet-group"
  }
}


resource "aws_db_parameter_group" "default" {
  name   = "roboshop-${var.ENV}-mysql-pg"
  family = "mysql5.7"

  }
