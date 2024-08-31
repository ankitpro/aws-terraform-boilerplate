module "asg" {
  source                          = "../../modules/asg"
  grid_domain                     = var.grid_domain
  autoscaling_goups               = var.autoscaling_goups
  environment                     = var.environment
  common_tags                     = var.common_tags
  grid_secret_name                = var.grid_secret_name
  logs_bucket_name                = var.logs_bucket_name
  alb_name                        = var.alb_name
  alb_subnets                     = var.alb_subnets
  aws_alb_target_group_name       = var.aws_alb_target_group_name
  aws_security_group_rule_sg_id   = var.aws_security_group_rule_sg_id
  all_tags                        = var.all_tags
  aws_sns_topic_name              = var.aws_sns_topic_name
  lambda_role_policy_name         = var.lambda_role_policy_name
  aws_security_group_vpc_id       = var.aws_security_group_vpc_id
  aws_alb_target_group_vpc_id     = var.aws_alb_target_group_vpc_id
  aws_security_group_name         = var.aws_security_group_name
  aws_security_group_description  = var.aws_security_group_description
  aws_lambda_function_name        = var.aws_lambda_function_name
  aws_ssm_document_name           = var.aws_ssm_document_name
  lambda_execution_role_name      = var.lambda_execution_role_name
  analytic_arm_role_name          = var.analytic_arm_role_name
  analytic_arm_policy_name        = var.analytic_arm_policy_name
  aws_iam_instance_profile_name   = var.aws_iam_instance_profile_name
  asg_security_group_name         = var.asg_security_group_name
  asg_security_group_description  = var.asg_security_group_description
  asg_security_group_vpc_id       = var.asg_security_group_vpc_id
  asg_security_group_prefix_ids   = var.asg_security_group_prefix_ids
  asg_security_group_predefined_sg = var.asg_security_group_predefined_sg
  asg_security_group_predefined_cidr = var.asg_security_group_predefined_cidr
  default_sg                          = var.default_sg
  grid_dashboard_endpoint_app_name = var.grid_dashboard_endpoint_app_name
  policy_attachments              = var.policy_attachments
  role_name                       = var.role_name
  iam_inline_policy_name          = var.iam_inline_policy_name
  lb_security_group_description   = var.lb_security_group_description
  lb_security_group_name          = var.lb_security_group_name
}