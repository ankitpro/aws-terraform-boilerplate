variable "name" {
  type        = string
  description = "Environment"

  validation {
    condition     = length(var.name) > 0
    error_message = "The 'name' variable must not be empty."
  }
}

variable "min_size" {
  type        = number
  description = "Minimum size of the resource."

  validation {
    condition     = var.min_size >= 0
    error_message = "The 'min_size' variable must be at least 1."
  }
}

variable "max_size" {
  type        = number
  description = "Maximum size of the resource."

  validation {
    condition     = var.max_size >= var.min_size
    error_message = "The 'max_size' variable must be greater than or equal to 'min_size'."
  }
}

variable "desired_capacity" {
  type        = number
  description = "Desired capacity of the resource."

  validation {
    condition     = var.desired_capacity >= var.min_size && var.desired_capacity <= var.max_size
    error_message = "The 'desired_capacity' variable must be between 'min_size' and 'max_size'."
  }
}

variable "vpc_zone_identifier" {
  type        = list(string)
  description = "List of VPC subnet identifiers."

  validation {
    condition     = length(var.vpc_zone_identifier) > 0
    error_message = "The 'vpc_zone_identifier' variable must contain at least one subnet ID."
  }
}
