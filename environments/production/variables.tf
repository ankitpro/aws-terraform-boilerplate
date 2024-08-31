variable "region" {
  type        = string
  description = "AWS Region in which the terraform resources will be created."
}

variable "autoscaling_goups" {
  type = map(object({
    name                     = string
    max_size                 = number
    min_size                 = number
    image_id                 = string
    launch_template_name     = string
    key_name                 = string
    desired_capacity         = number
    initial_lifecycle_hooks_name = string
    vpc_zone_identifier      = list(string)
    instance_type            = string
    availability_zone        = string
    # iam_role_name            = string
    # iam_instance_profile_arn = string
    # security_groups          = list(string)
    # tags                     = map(string)
    target_value             = string
    user_data_content        = string
    checkpoint_delay         = number
    checkpoint_percentages   = list(number)
    instance_warmup          = number
    min_healthy_percentage   = number
  }))
  description = "Information needed for autoscaling groups"
}

variable "all_tags" {
  type = map(string)
  description = "All Commmon Tags"
}


variable "common_tags" {
  type = object({
    environment = string
    terraform   = bool
  })
  description = "Account Commmon Tags"
}

variable "environment" {
  type        = string
  description = "Environment"
  # default     = "dev"
}

variable "logs_bucket_name" {
  type        = string
  description = "Bucket name for the logs of ssm and lambda executions"
}

variable "grid_secret_name" {
  type        = string
  description = "Name of the secret in Secret manager which holds grid user creds"
}


variable "alb_name" {
  type        = string
  description = "ALB name"
  # default     = "Analytics-Arm-Alb-dev"
}

variable "alb_subnets" {
  type        = list(string)
  description = "ALB Subnets"
  # default     = ["subnet-07fd711411dc53caf","subnet-0b1b154bccb696559"]
}

variable "aws_alb_target_group_name" {
  type        = string
  description = "ALB Target Group Name"
  # default     = "Analytics-Arm-dev"
}

variable "aws_alb_target_group_vpc_id" {
  type        = string
  description = "ALB Target Group VPC id"
  # default     = "vpc-04aeb3a380d57cca6"
}

variable "aws_security_group_name" {
  type        = string
  description = "ALB Security Group Name"
  # default     = "Analytics-Arm-sg-dev"
}

variable "aws_security_group_description" {
  type        = string
  description = "ALB Security Group description"
  # default     = "Security group for ALB"
}

variable "aws_security_group_vpc_id" {
  type        = string
  description = "ALB Security Group VPC ID"
  # default     = "vpc-04aeb3a380d57cca6"
}

variable "aws_security_group_rule_sg_id" {
  type        = string
  description = "ALB Security Group rule  security Group ID"
  # default     = "sg-0b223de97d109bf67"
}

variable "aws_sns_topic_name" {
  type        = string
  description = "SSM document name"
  # default     = "graceful_termination_autoscale"
}

variable "aws_ssm_document_name" {
  type        = string
  description = "SSM document name"
  # default     = "DeregisterNodesFromASG"
}
variable "lambda_execution_role_name" {
  type        = string
  description = "Lambda execution role name"
  # default     = "lambda_execution_role"
}

variable "lambda_role_policy_name" {
  type        = string
  description = "Lambda role policy name"
  # default     = "lifecycle_hook_autoscaling_policy"
}

variable "analytic_arm_role_name" {
  type        = string
  description = "Launch template role name"
  # default     = "lifecycle_hook_autoscaling_policy"
}

variable "analytic_arm_policy_name" {
  type        = string
  description = "Analytic Arm policy name"
  # default     = "lifecycle_hook_autoscaling_policy"
}

variable "aws_iam_instance_profile_name" {
  type        = string
  description = "IAM instance profile name"
  # default     = "launch-template-instance-profile"
}

variable "aws_lambda_function_name" {
  type        = string
  description = "Analytic Arm role policy name"
  # default     = "asg-graceful-shutdown"
}

variable "grid_domain" {
  type        = string
  description = "grid domain"
  # default     = "dash.dev.tendplatform.com"
}

variable "asg_security_group_name" {
  type        = string
  description = "asg_security_group_name"
}

variable "asg_security_group_description" {
  type        = string
  description = "asg_security_group_description"
}

variable "asg_security_group_vpc_id" {
  type        = string
  description = "asg_security_group_vpc_id"
}

variable "asg_security_group_prefix_ids" {
  type        = list(string)
  description = "ASG Security Group Prefix IDs"
  # default     = ["pl-7ba54012"]
}

variable "asg_security_group_predefined_sg" {
  type        = list(string)
  description = "ASG Security Group Predefined SGs"
  # default     = ["sg-01f75f44e61299de3"]
}

variable "asg_security_group_predefined_cidr" {
  type        = list(string)
  description = "ASG Security Group Predefined CIDR"
  # default     = ["sg-01f75f44e61299de3"]
}

variable "default_sg" {
  type        = string
  description = "sg-0e5615a4af7d5388e"
}

# # Define a list of policy ARNs to attach
# variable "policy_arns" {
#   type        = list(string)
#   description = "ASG Security Group policies"
#   # default = [
#   #   "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore",
#   #   "arn:aws:iam::aws:policy/AmazonEC2FullAccess",
#   #   "arn:aws:iam::aws:policy/AWSXrayFullAccess",
#   #   "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy",
#   #   "arn:aws:iam::584734538653:policy/CodeDeploy-EC2-Permissions",
#   #   "arn:aws:iam::584734538653:policy/SSM-preprod-s3"
#   # ]
# }
variable "grid_dashboard_endpoint_app_name" {
  type        = string
  description = "default_endpoint_appname"
}

variable "policy_attachments" {
  description = "List of policy ARNs to attach"
  type        = list(string)
}

variable "role_name" {
  type          = string
  description   = "Launch template role name"
  # default     = "lifecycle_hook_autoscaling_policy"
}

variable "iam_inline_policy_name" {
  type          = string
  description   = "Inline policy name which will be attached to IAM role created for ASG"
  # default     = "subnet-0c29d77e43a4a465d"
}

variable "lb_security_group_name" {
  type          = string
  description   = "LB security group name"
}

variable "lb_security_group_description" {
  type          = string
  description   = "LB security group description"
}