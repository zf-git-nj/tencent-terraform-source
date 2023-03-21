terraform {
  required_providers {
    tencentcloud = {
        source = "tencentcloudstack/tencentcloud"
        version = "1.79.6"
    }
#    random = {
#        version = "=3.1.3"
#    }
  }
  
  backend "cos" {
  }
}

# main provider
provider "tencentcloud" {
  region = var.region
}

