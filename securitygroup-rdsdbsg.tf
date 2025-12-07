module "rdsdb_sg" {
  source = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"

  name = "rdsdb-sg"
  description = "Access to MySQL DB"
  vpc_id = module.vpc.vpc_id

 ingress_with_cidr_blocks = [
    {
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        description = "MYSQL access from within VPC"
        cidr_blocks = module.vpc.vpc_cidr_block
    },
 ]

 egress_rules = ["all-all"]
 tags = local.common_tags
}

