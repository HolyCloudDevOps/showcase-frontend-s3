variable "env" {
  description = "The environment for the Terraform state (dev, staging, prod)"
  default     = "dev"
}

variable "region" {
  description = "AWS region"
  default = "us-east-1"
}
