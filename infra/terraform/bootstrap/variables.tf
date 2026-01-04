variable "project" {
  type        = string
  description = "Project name used in resource naming."
  default     = "aws-terraform-devops-platform"
}

variable "aws_region" {
  type        = string
  description = "AWS region for bootstrap resources."
  default     = "us-east-1"
}

