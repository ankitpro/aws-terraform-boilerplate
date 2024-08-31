resource "aws_lambda_function" "this" {
  filename      = "${path.module}/files/ssm_trigger.zip"
  function_name = var.function_name
  role          = var.role_name
  handler       = "ssm_trigger.lambda_handler"
  source_code_hash = filebase64sha256("${path.module}/files/ssm_trigger.zip")
  runtime = "python3.11"
  tags = var.tags
  timeout = 180

  environment {
    variables = {
      logs_bucket      = var.logs_bucket
      region           = var.region
    }
  }
}