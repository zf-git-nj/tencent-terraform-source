# Implicit provider inheritance not working, this is required at module level
terraform {
  required_providers {
    tencentcloud = {
        source = "tencentcloudstack/tencentcloud"
        version = "=1.79.6"
    }
  }
}