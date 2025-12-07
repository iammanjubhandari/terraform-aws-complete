module "ec2_private_app3" {
  depends_on = [ module.vpc ]
  source = "terraform-aws-modules/ec2-instance/aws"
  name = "${var.environment}-app3"
  ami = data.aws_ami.amilinux2.id
  instance_type = var.instance_type
}