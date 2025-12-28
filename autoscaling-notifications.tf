

## SNS - Topic
resource "aws_sns_topic" "myasg_sns_topic" {
  name = "myasg-sns-topic-${random_pet.this.id}"
}

resource "aws_sns_topic_subscription" "myasg_sns_topic_subscription" {
  topic_arn = aws_sns_topic.myasg_sns_topic.arn
  protocol  = "email"
  endpoint  = "stacksimplify@gmail.com"
}


resource "aws_autoscaling_notification" "myasg_notifications" {
  group_names = [aws_autoscaling_group.my_asg.id]
  notifications = [
    "autoscaling:EC2_INSTANCE_LAUNCH",
    "autoscaling:EC2_INSTANCE_TERMINATE",
  ]
  topic_arn = aws_sns_topic.myasg_sns_topic.arn 
}