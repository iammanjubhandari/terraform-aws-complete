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

output "public_subnets" {
    description = "IDs of Public Subnet"
    value = module.vpc.vpc_public_subnets
}

output "nat_public_ips" {
  description = "Elastic IPs created for AWS NAT Gateway"
  value = module.vpc.nat_public_ips
}

output "azs" {
    description = "Availablity zones"
    value = module.vpc.azs
}