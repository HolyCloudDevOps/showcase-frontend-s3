terraform {
  cloud {
    organization = "hollydevops"
    workspaces {
      name = "workspace-${var.environment}"
    }
  }
}

variable "environment" {
  description = "Environment name"
  default     = "dev"
}
