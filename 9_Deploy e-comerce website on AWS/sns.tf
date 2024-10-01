# create an sns topic
resource "aws_sns_topic" "user_updates" {
  name = "dev-sns-topic"
}

# create an sns topic subscription
resource "aws_sns_topic_subscription" "notification_topic" {
  topic_arn = aws_sns_topic.user_updates.arn
  protocol  = "email"
  endpoint  = "djkone2025@gmail.com"
}

# Remember to go to your email and confirm subscription