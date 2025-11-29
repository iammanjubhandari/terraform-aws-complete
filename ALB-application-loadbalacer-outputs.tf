output "id" {
    description = "The ID and ARN of the load balacer we created"
    value = module.alb.id
}

output "arn" {
    description = "The ID and ARN of the load balacer"
    value = module.alb.arn
}

output "arn_suffix" {
  description = "ARN suffix of our load balancer - can be used with cloudwatch"
  value = module.alb.arn_suffix
}

output "dns_name" {
    description = "THE DNS name of the load balacer"
    value = module.alb.dns_name
}

output "listeners" {
    description = "Maps of listerners created and thier attributes"
    value = module.alb.listeners
    sensitive = true 
}

output "target_groups" {
  description = "Map of target groups created and thier attribites"
  value = module.alb.target_groups
}