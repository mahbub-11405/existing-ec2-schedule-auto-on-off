resource "aws_cloudwatch_event_rule" "ec2_schedule_auto_on_off" {
  name                = var.name
  schedule_expression = var.ec2_schedule_auto_on_off
}

resource "aws_cloudwatch_event_target" "ec2_schedule_auto_on_off_target" {
  rule = aws_cloudwatch_event_rule.ec2_schedule_auto_on_off.name
  arn  = var.lambda_arn
}

resource "aws_lambda_permission" "allow_event" {
  statement_id  = "AllowEvent-${var.name}"
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_arn
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.ec2_schedule_auto_on_off.arn
}
