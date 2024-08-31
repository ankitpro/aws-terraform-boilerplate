variable "logs_bucket_name" {
  type        = string
  description = "Environment"

  validation {
    condition     = length(var.logs_bucket_name) > 0
    error_message = "The log bucket name cannot be empty."
  }
}

variable "tags" {
  type = map(string)
  description = "All Tags"
}

variable "environment" {
  type        = string
  description = "Environment"

  validation {
    condition     = length(var.environment) > 0
    error_message = "The environment cannot be empty."
  }
}