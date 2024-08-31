variable "tags" {
  type = map(string)
  description = "All Tags"
}

variable "function_name" {
  type        = string
  description = "Environment"

  validation {
    condition     = length(var.function_name) > 0
    error_message = "The function_name cannot be empty."
  }
}

variable "role_name" {
  type        = string
  description = "Environment"

  validation {
    condition     = length(var.role_name) > 0
    error_message = "The role_name cannot be empty."
  }
}

variable "logs_bucket" {
  type        = string
  description = "Environment"

  validation {
    condition     = length(var.logs_bucket) > 0
    error_message = "The logs_bucket cannot be empty."
  }
}

variable "region" {
  type        = string
  description = "Environment"

  validation {
    condition     = length(var.region) > 0
    error_message = "The region cannot be empty."
  }
}