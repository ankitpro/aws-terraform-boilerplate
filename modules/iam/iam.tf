resource "aws_iam_role" "this" {
  name                = var.role_name
  tags                = var.tags
  assume_role_policy  = templatefile("${path.module}/files/assume_role.json.tmpl", {})
}

resource "aws_iam_role_policy" "lambda_role_policy" {
  name   = var.policy_name
  role   = aws_iam_role.this.id
  policy = templatefile("${path.module}/files/iam_permission.json.tmpl", {})
}