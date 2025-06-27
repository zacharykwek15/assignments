data "aws_caller_identity" "current" {}

locals {
  name_prefix = split("/", "${data.aws_caller_identity.current.arn}")[1]
}

resource "aws_cloudwatch_log_metric_filter" "metric_filter" {
  name           = "zh-info-count"
  pattern        = "[INFO]"
  log_group_name = aws_cloudwatch_log_group.log.name

  metric_transformation {
    name      = "info-count"
    namespace = "/moviedb-api/zh1"
    value     = "1"
  }
}

#create a cloudwatch log group
resource "aws_cloudwatch_log_group" "log" {
  name = "/aws/lambda/zacharykwek15-topmovies-api"
}


#Creation of Cloudwatch metrics alarm
resource "aws_cloudwatch_metric_alarm" "info_log_alarm" {
  alarm_name          = "zh-info-count-breach"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "info-count"
  namespace           = "/moviedb-api/zh1"
  period              = 60      #1 min
  statistic           = "Sum"
  threshold           = 10      #Alarm will trigger if beyond this threshold
  treat_missing_data  = "notBreaching"
  alarm_description   = "Triggered when INFO logs exceed 50 in 1 minute"
  actions_enabled     = true

  alarm_actions = [aws_sns_topic.alert_topic.arn]

}


#Creating SNS topic for alert
resource "aws_sns_topic" "alert_topic" {
  name = "top-movies-alert"   #Alert name 

}
#Creating email subscription to the SNS topic
resource "aws_sns_topic_subscription" "email_sub" {
  topic_arn = aws_sns_topic.alert_topic.arn
  protocol = "email"
  endpoint = "zhi_hong_sn@yahoo.com.sg"

}