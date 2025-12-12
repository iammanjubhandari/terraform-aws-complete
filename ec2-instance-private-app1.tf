module "ec2_private_app1" {
  depends_on = [ module.vpc ]
  source = "terraform-aws-modules/ec2-instance/aws"
  version = "6.0.2"

  name = "${var.environment}-app1"
  ami = data.aws-ami.amzlinux2.id
  instance_type = var.instance_type
  key_name = var.instance_keypair
  user_data = file("${path.module}/app1-install.sh")
  tags = local.common_tags

 for_each = toset(["0","1"])
}