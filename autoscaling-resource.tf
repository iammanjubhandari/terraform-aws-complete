# Autoscaling Group Resource

resource "aws_autoscaling_group" "my_asg" {
    name_prefix = "myasg-"
    desired_capacity = 2
    max_size = 10
    min_size = 2
    vpc_zone_identified = module.vpc_private_subnets

    target_group_arns = module.a;b.target_groups_arns

    health_check_type = "Ec2"
    health_check_grace_peroid = 300
    launch_template {
        id = aws_launch_template.my_launch_template.id
        version = aws_launch_template.my_launch_template.latest_version
    }
 
    instance_refresh {
      strategy = "Rolling"
      preferences {
      min_healthy_percentage = 50  
      }
    triggeres = ["sesired_capacity"]
    }
    tag {
        key     = "Owners"
        value   =  "Web_Team"
        propogate_at_launch = true
    }
}