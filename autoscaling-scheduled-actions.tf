### Scheduled Action-1: Increase capacity during business hours
resource "aws_autoscaling_schedule" "increase_capacity_7am" {
  scheduled_action_name  = "increase-capacity-7am"
  start_time             = "2030-03-30T11:00:00Z"
  autoscaling_group_name = aws_autoscaling_group.my_asg.id 
}