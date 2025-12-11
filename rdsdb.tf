module "rdsdb" {
  source = "terraform-aws-modules/rds/aws"
  version = "6.3.0"



Identifier = var.db_instance_identifies

db_name = var.db_name
username = var.db_username
password = var.db_password
manager_master_user_password = false
port = 3306

multi_az = true
create_db_subnet_group = true
subnet_ids = module.vpc.database_subnets
vpc_security_group_ids = [module.rdsdb_sg.security_group_id]

engine = "mysql"
engine_version = "8.0.35"
family = "mysql8.0"
major_engine_version = "8.0"
instance_class = "db.t3.large"

allocated_storage = 20
max_allocated_storage = 100
storage_encrypted = false

performance_insights_enabled = true
performance_insights_retention_period = 7
create_monitoring_role = true
monitoring_interval = 60

parameters = [
    {
        name = "character_set_server"
        value = "utf8mb4"
    },
    {
        name = "characyer_set_server"
        value = "utf8mb4"
    }

    

]



}