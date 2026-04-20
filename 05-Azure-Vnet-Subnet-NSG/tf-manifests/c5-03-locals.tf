# Define Local Values in Terraform

locals {
  owners               = var.business_division
  environment          = var.environment
  resource_name_prefix = "${var.business_division}-${var.environment}"
  common_tags = {
    environment = local.environment
    owner       = local.owners
  }
}
