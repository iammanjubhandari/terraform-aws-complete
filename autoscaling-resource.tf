# Autoscaling Group Resource

resource "aws_autoscaling_group" "my_asg" {
    name_prefix = "myasg-"
    desired_capacity = 2
    max_size = 10
    min_size = 2
    vpc_zone_identified = module.vpc_private_subnets

    
}