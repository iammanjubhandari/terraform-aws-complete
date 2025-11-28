module "private_sg" {
  source = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"

  name = "private-sg"
  description = "Security group"
  vpc_id = module.vpc.vpc_id
  
}