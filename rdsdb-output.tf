output "db_instance_address" {
  description = "The address of the RDS instance"
  value = module.rdsdb.db_instance_address
}

output "db_instance_arn" {
  description = "RDS ARN"
  value = module.rdsdb.db_instance_arn
}

output "db_instance_availability_zone" {
  description = "RDS instance of AZ"
  value = module.rdsdb_instance_avaiablity_zone
}

output "db_instance_endpoint" {
  description = "The connection endpoint"
  value = module.rdsdb.db_instance_endpoint
}

output "db_instance_hosted_zone_id" {
  description = "The cononical hosted zone ID of the DB instance"
  value = module.rdsdb.db_instance_hosted_zone_id
}

output "db_instance_id" {
  description = "The RDS instance ID"
  value = module.rdsdb.db_instance_identifier
}


output "db_instance_resource_id" {
  description = "The database name"
  value = module.rdsdb.db_instance_resource_id
}

output "db_instance_name" {
  description = "The database name"
  value = module.rdsdb.db_instance_username
  sensitive = true
}

output "db_instance_port" {
  description = "The database port"
  value = module.rdsdb.db_instance_port
  sensitive = true
}

output "db_subent_group_id" {
  description = "DB subent group name"
  value = module.rdsdb_db_subnet_group_arn
}

output "db_subnet_group_arn" {
    description = "ARN of the db subnet group"
    value = module.dsdb.db_paramater_group_arn
}

output "db_parameter_group_id" {
  description = "The DB parameter group id"
  value = module.rdsdb.db_parameter_group_id
}

output "db_parameter_group_arn" {
  description = "DB parameter group ARN"
  value = module.rdsdb.db_parameter_group_arn
}

output "db_enhanced_monitoring_iam_role_arm" {
  description = "ARN specifying the monioting role"
  value = module.rdsdb.enhanced_monitoring_iam_role_arn
}



