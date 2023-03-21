terraform {
  required_providers {
    tencentcloud = {
        source = "tencentcloudstack/tencentcloud"
        version = "=1.79.6"
    }
  }
}

# main provider
provider "tencentcloud" {
  region = var.region
}