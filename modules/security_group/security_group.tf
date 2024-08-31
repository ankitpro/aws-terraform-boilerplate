resource "aws_security_group" "this" {
  name        = var.security_group_name
  description = var.security_group_description
  vpc_id      = var.security_group_vpc_id

  // Default self ingress rule
  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    self      = true
  }

  // Dynamic ingress rules
  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      description = ingress.value.description != "" ? ingress.value.description : null

      // Conditionally include cidr_blocks if provided
      cidr_blocks = ingress.value.cidr_blocks != [] ? ingress.value.cidr_blocks : null

      // Conditionally include security_groups if provided
      security_groups = ingress.value.security_groups != [] ? ingress.value.security_groups : null

      // Conditionally include cidr_blocks if provided
      ipv6_cidr_blocks = ingress.value.ipv6_cidr_blocks != [] ? ingress.value.ipv6_cidr_blocks : null

      // Conditionally include security_groups if provided
      prefix_list_ids = ingress.value.prefix_list_ids != [] ? ingress.value.prefix_list_ids : null
    }
  }

  // Dynamic egress rules
  dynamic "egress" {
    for_each = var.egress_rules
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      description = egress.value.description != "" ? egress.value.description : null
      // Conditionally include cidr_blocks if provided
      cidr_blocks = egress.value.cidr_blocks != [] ? egress.value.cidr_blocks : null

      // Conditionally include security_groups if provided
      security_groups = egress.value.security_groups != [] ? egress.value.security_groups : null

      // Conditionally include cidr_blocks if provided
      ipv6_cidr_blocks = egress.value.ipv6_cidr_blocks != [] ? egress.value.ipv6_cidr_blocks : null

      // Conditionally include security_groups if provided
      prefix_list_ids = egress.value.prefix_list_ids != [] ? egress.value.prefix_list_ids : null
      # security_groups = egress.value.security_groups != [] ? egress.value.security_groups : null
    }
  }
}
