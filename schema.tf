# Injecting the schema
resource "null_resource" "schema" {
  depends_on = [aws_db_instance.mysql]
  
  provisioner "local-exec" {
    command = <<EOF
      cd /tmp 
      curl -s -L -o /tmp/mysql.zip "https://github.com/stans-robot-project/mysql/archive/main.zip"
      unzip -o /tmp/mysql.zip 
      cd mysql-main
      mysql -h roboshop-dev-mysql.cf6ic4gs8isj.us-east-1.rds.amazonaws.com -uprem -ppremsagar < shipping.sql
EOF
  }
}
