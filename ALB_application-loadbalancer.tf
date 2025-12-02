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
        my-http-https=redirects = {
            port = 80
            protocol = "HTTP"
            redirects = {
                port = "443"
                protocol = "HTTPS"
                status_code = "HTTP_301"
            }
        }
    }

    my-https-listener{
        port = 443
        protocol = "text/plain"
        message_body = "Fixed Static message - For Root Context"
        status_code = "200"
    }

    rules = {
        myapp1-rule[{
            actions = [{
                target_groups = [
                    {
                    target_group_key = "mytg1"
                    weight = 1
                    } 
                ]
                stickness = {
                    enabled = true
                    duration = 3600
                }
            }]
            conditions = [{
                host_header = {
                    values = [var.app1_dns_name]
                }
            }]
          }
          myapp2-rule = {
            actions = [{
                type = "weight-forward"
                target_groups =[
                    {
                        target_group_key = "mytg2"
                        weight = 1
                    }
                    stickness ={
                        enabled = true
                        duration = 3600
                    }
            }]
            conditions = [{
                host_header = {
                    values = [var.app2_dns_name]
                }
            }]
          }
        }]
    }

    target_groups = {
        mytg1 = {
            create_attachment = false
            name_prefix = "mytg1-"
            protocol = 80
        
            port = 80
            target_type = "instance"
            deregistration_delay = 10
            load_balacing_cross_zone_enable = false
            protocol_version = "HTTP1"
            health_check = {
                enabled             = true
                interval            = 30
                path                = "/app1/index.html"
                healthy_threshold   = 3
                unhealthy_threshold = 6
                protocol            = "HTTP"
                matcher             = "200-399"
            }
            tags = local.common_tags
        }
    }
    tags = local.commom_tags
}

    mytg2 = {
        create_attachment = false
        name_prefix = "mytg2-"
        port = 80
        target_type = "instance"
        deregistration_delay = 10
        load_balacing_cross_zone_enable = false
        protocol_version = "HTTP1"
        health_check = {
            enabled = true
            interval = 30
            path = "/app2/index.html"
            port = "traffic-port"
            healthy_threshold = 3
            unhealthy_threshold = 3
            timeout = 6
            protocol = "HTTP"
            matcher = "200-399"
        }
        tags = local.commom_tags
    }
    tags = local.common_tags
 }

resource "aws_lb_target_group_attachment" "mytg1" {
    for_each = {for k, v in module.ec2_private: k => v}
    target_group_arn = module.alb.target_groups["mytg1"].arn
    target_id = each.value.id
    port = 80
}

output "zz_ec2_private" {
    value = {for ec2_instance, ec2_instance_details in module.ec2_private: ec2_instance => ec2_instance}  
}