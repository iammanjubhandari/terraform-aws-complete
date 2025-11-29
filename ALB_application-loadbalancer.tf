module "alb" {
    source = "terraform-aws-modules/alb/aws"
    version = "9.4.0"

    name = "${local.name}-alb"
    load_balancer_type = "application"
    vpc_id = module.vpc.vpc.id
    subnets = module.vpc.public_subnets

    security_groups = [module.loadbalancer_sg.security_group_id]

    enable_deletion_protection = false

    listeners = {
        my-http-listener = {
            port = 80
            protocol = "HTTP"
            forward = {
                target_group_key = "mytg1"
            }
        }
    }
  
}