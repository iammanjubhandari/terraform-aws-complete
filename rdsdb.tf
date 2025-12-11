module "rdsdb" {
  source = "terraform-aws-modules/rds/aws"
  version = "6.3.0"



Identifier = var.db_instance_identifies

db_name = var.db_name
username = var.db_username
password = var.db_password
manager_master_user_password = false
port = 3306

}