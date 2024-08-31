variable "role_name" {
  type        = string
  description = "Environment"

  validation {
    condition     = length(var.role_name) > 0
    error_message = "The role_name cannot be empty."
  }
}

variable "tags" {
  type = map(string)
  description = "All Tags"
}

variable "policy_name" {
  type        = string
  description = "Environment"

  validation {
    condition     = length(var.policy_name) > 0
    error_message = "The policy_name cannot be empty."
  }
}