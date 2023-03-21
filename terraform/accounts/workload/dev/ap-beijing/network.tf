module "vpc" {
  source           = "../../../../modules/network/vpc"
  account_name     = var.account_name
  region           = var.region
  region_code      = var.region_code
  vpc_cidr         = var.vpc_cidr
}
