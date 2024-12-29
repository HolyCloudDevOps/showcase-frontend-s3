variable "env" {
  description = "The environment for the Terraform state (dev, staging, prod)"
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be one of 'dev', 'staging', or 'prod'."
  }
}

variable "region" {
  description = "AWS region"
  default = "us-east-1"
}
