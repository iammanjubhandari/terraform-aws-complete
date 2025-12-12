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

output "db_instance_password" {
  description = "The database password"
  value = module.rdsdb.db_instance_password
  sensitive = true
}



