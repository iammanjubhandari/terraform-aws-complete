module "public_bastion_sg" {
  source = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"

  name = public-public_bastion_sg
  description = "Security Group with SSH port opne"
  
}