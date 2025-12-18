output "launcg_template_id" {
    description = "Launch Template ID"
    value = aws_launch_template.my_launch_template.id
}

output "launch_template_latest_version" {
  description = "Launch Template Latest Version"
  value = aws_lauch_template.my_launch_tamplete.latest_version
}

output "autoscaling_group_id" {
  description = "Autoscaling Group ID"
  value = aws_autoscaling_group.my_asg.id
}



