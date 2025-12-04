resource "aws_iam_role" "lambda_auto_on_off_role" {
  name = "lambda-ec2-auto-on-off-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action    = "sts:AssumeRole",
      Effect    = "Allow",
      Principal = { Service = "lambda.amazonaws.com" }
    }]
  })
}

resource "aws_iam_policy" "lambda_auto_on_off_role_policy" {
  name = "lambda-ec2-auto-on-off-role-policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = ["ec2:StartInstances", "ec2:StopInstances", "ec2:DescribeInstances"]
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Action   = ["logs:CreateLogGroup", "logs:CreateLogStream", "logs:PutLogEvents"]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach" {
  policy_arn = aws_iam_policy.lambda_auto_on_off_role_policy.arn
  role       = aws_iam_role.lambda_auto_on_off_role.name
}

output "role_arn" {
  value = aws_iam_role.lambda_auto_on_off_role.arn
}
