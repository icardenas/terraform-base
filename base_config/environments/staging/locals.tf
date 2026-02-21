locals {
  env_prefix = "${var.project_name}-${var.environment}"
  resource_group_name = "${local.env_prefix}-rg"
  
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}
