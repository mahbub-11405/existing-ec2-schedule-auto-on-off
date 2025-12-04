resource "aws_lambda_function" "ec2_lambda_control_auto_on_off" {
  function_name = "ec2-lambda-control-auto-on-off"
  role          = var.role_arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.10"
  timeout       = 120

  filename         = "${path.module}/lambda_function.zip"
  source_code_hash = filebase64sha256("${path.module}/lambda_function.zip")

  environment {
    variables = {
      INSTANCE_IDS = join(",", var.instance_ids)
      ACTION       = var.action
    }
  }
}

output "lambda_arn" {
  value = aws_lambda_function.ec2_lambda_control_auto_on_off.arn
}
