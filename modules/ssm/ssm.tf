resource "aws_ssm_document" "this" {
  name          = var.name
  document_type = "Command"
  tags          = var.tags
  content       = file("${path.module}/files/ssm_document.json")
}