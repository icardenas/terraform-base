locals {
  resource_group_name = "${var.project_name}-${var.environment}-rg"
  
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}
