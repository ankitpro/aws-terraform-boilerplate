variable "name" {
  type        = string
  description = "Environment"

  validation {
    condition     = length(var.name) > 0
    error_message = "The name cannot be empty."
  }
}

variable "tags" {
  type = map(string)
  description = "All Tags"
}

variable "endpoint" {
  type        = string
  description = "Environment"

  validation {
    condition     = length(var.endpoint) > 0
    error_message = "The endpoint cannot be empty."
  }
}