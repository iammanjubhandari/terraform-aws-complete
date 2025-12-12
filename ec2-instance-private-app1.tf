module "ec2_private_app1" {
  depends_on = [ module.vpc ]
  source = "terraform-aws-modules/ec2-instance/aws"
  version = "6.0.2"
}