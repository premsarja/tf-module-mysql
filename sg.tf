
resource "aws_security_group" "allows_mysql" {
  name        = "mysql allows internal traffic"
  description = "Allow private traffics"
  vpc_id =   data.terraform_remote_state.vpc.outputs.VPC_ID

  ingress {
    description = "redis  from private network "
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [data.terraform_remote_state.vpc.outputs.VPC_CIDR]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "roboshop-${var.ENV}-mysql-sg   "
  }
}

