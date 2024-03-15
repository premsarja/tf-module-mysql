resource "null_resource" "schema" {
  depends_on = [aws_db_instance.RDS]

  provisioner "local-exec" {
    command = <<EOF
      cd /tmp      
      curl -s -L -o /tmp/mysql.zip "https://github.com/stans-robot-project/mysql/archive/main.zip"
      unzip -o /tmp/mysql.zip
      cd /tmp/mysql-main
      mysql -h ${aws_db_instance.RDS.address} -uprem -ppremsagar < shipping.sql
    EOF
  }
}
