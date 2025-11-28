output "vpc_id" {
  description = "VPC ID"
  value = module.vpc.vpc_id
}


output "vpc_cidr_block" {
  description = "CIDR block of the VPC"
  value = module.vpc.vpc_cidr_block
}

output "private_subnets" {
  description = "IDs of Private Subnet"
  value = module.vpc.vpc_private_subnets
}

