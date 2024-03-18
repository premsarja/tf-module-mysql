resource "null_resource" "schema" {

provisioner "local-exec" {
    command = <<EOF
      cd /tmp      
      curl -s -L -o /tmp/mysql.zip "https://github.com/stans-robot-project/mysql/archive/main.zip"
      unzip -o /tmp/mysql.zip
      cd mysql-main
      mysql -h {$} -uprem -ppremsagar < shipping.sql
    EOF
  }
}
