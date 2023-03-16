resource "aws_sns_topic" "user_updates" {
  name      = "web01-sns-topic"
}

resource "aws_sns_topic_subscription" "notification_topic" {
  topic_arn = aws_sns_topic.user_updates.arn
  protocol  = "email"
  endpoint  = var.client_email
}