output "db_instance_address" {
  description = "The address of the RDS instance"
  value = module.rdsdb.db_instance_address
}

output "db_instance_arn" {
  description = "RDS ARN"
  value = module.rdsdb.db_instance_availability_zone
}