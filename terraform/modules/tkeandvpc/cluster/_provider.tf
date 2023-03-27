# Implicit provider inheritance not working, this is required at module level
terraform {
  required_providers {
      kubernetes = {
        source  = "hashicorp/kubernetes"
        version = ">= 2.0.0"
      }
      tencentcloud = {
          source = "tencentcloudstack/tencentcloud"
          version = "=1.79.6"
      }
  }
}