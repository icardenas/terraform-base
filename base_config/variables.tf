variable "subscription_id" {
  description = "The Azure subscription ID"
  type        = string
}

variable "location" {
  description = "The Azure region to deploy resources"
  type        = string
  default     = "East US"
}

variable "project_name" {
  description = "The name of the project"
  type        = string
  default     = "terraform-demo"
}

variable "environment" {
  description = "The environment name (e.g., dev, prod)"
  type        = string
  default     = "dev"
}
