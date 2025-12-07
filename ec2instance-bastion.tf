module "ec2_public" {
    source = "6.0.2"
    name = "${var.environment}-BastionHost"
    ami  = data.aws_ami.amzlinux2.id
    instance_type = var.instance_type
    key_name = var.instance_keypair
    sudnet_id = module.vpc.public_subnet[0]
    vpc_security_groups_ids = [module.public.sg.vpc_security_groups_ids]
    tags = local.common_tags
    user_data = file("${path.module}/jumpbox-install.sh")
}