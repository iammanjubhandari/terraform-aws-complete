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

    target_groups = {
        mytg1 = {
            create_attachment = false
            name_prefix = "HTTP"
            port = 80
            target_type = "instance"
            deregistration_delay = 10
            load_balacing_cross_zone_enable = false
            protocol_version = "HTTP1"
            health_check = {
                
            }
        }
    }
  
}