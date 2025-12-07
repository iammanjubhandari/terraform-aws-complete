module "ec2_private_app3" {
  depends_on = [ module.vpc ]
  source = "terraform-aws-modules/ec2-instance/aws"
  name = "${var.environment}-app3"
  ami = data.aws_ami.amilinux2.id
  instance_type = var.instance_type
  key_name = var.instance_keypair
  user_data = templatefile("app3-ums-install.tmpl",{rds_db_endpoint = module.rdsdv.db_instance_address})
  tags = local.common_tags

  for_each = toset(["0","1"])
  subnet_id = element(module.vpc.private_subnets, tonumber(each.key))
  vpc_security_group_ids = [module.private_sg.security_group_id]

}