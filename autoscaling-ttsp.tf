resource "aws_autoscaling_policy" "avg_cpu_policy_greater_than_xx" {
  name                   = "avg-cpu-policy-greater-than-xx"
  policy_type = "TargetTrackingScaling" 
  autoscaling_group_name = aws_autoscaling_group.my_asg.id 
  estimated_instance_warmup = 180 
}
