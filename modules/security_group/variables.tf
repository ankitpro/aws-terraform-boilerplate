variable "security_group_name" {
  type        = string
  description = "security_group_name"
  validation {
    condition     = length(var.security_group_name) > 0
    error_message = "The security group name cannot be empty."
  }
}

variable "security_group_description" {
  type        = string
  description = "security_group_description"
  validation {
    condition     = length(var.security_group_description) > 0
    error_message = "The security group description cannot be empty."
  }
}

variable "security_group_vpc_id" {
  type        = string
  description = "security_group_vpc_id"
  validation {
    condition     = length(var.security_group_vpc_id) > 0
    error_message = "The VPC ID cannot be empty."
  }
}

variable "ingress_rules" {
  description = "List of ingress rules for the ASG security group"
  type = list(object({
    from_port        = number
    to_port          = number
    protocol         = string
    cidr_blocks      = list(string)
    ipv6_cidr_blocks = list(string)    # Pass an empty list if not needed
    security_groups  = list(string)    # Pass an empty list if not needed
    prefix_list_ids  = list(string)
    description      = string
  }))
  default = []
  validation {
    condition = alltrue([
      for rule in var.ingress_rules :
      (rule.from_port <= rule.to_port) && length(rule.protocol) > 0
    ])
    error_message = "Each ingress rule must have a valid protocol and 'from_port' must be less than or equal to 'to_port'."
  }
}

variable "egress_rules" {
  description = "List of egress rules for the ASG security group"
  type = list(object({
    from_port        = number
    to_port          = number
    protocol         = string
    cidr_blocks      = list(string)
    ipv6_cidr_blocks = list(string)    # Pass an empty list if not needed
    security_groups  = list(string)    # Pass an empty list if not needed
    prefix_list_ids  = list(string)
    description      = string
  }))
  default = []
  validation {
    condition = alltrue([
      for rule in var.egress_rules :
      (rule.from_port <= rule.to_port) && length(rule.protocol) > 0
    ])
    error_message = "Each egress rule must have a valid protocol and 'from_port' must be less than or equal to 'to_port'."
  }
}
