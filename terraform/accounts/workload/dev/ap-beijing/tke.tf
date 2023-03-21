module "tke" {
  source           = "../../../../modules/tke/cluster"
  name             = "edge-main-cluster"
  vpc_id           = module.vpc.id
  cluster_cidr     = var.cluster_cidr
  c_subnet    = module.vpc.protected_subnet #TODO, use protected subnet
  #password         = module.vm_password.result
}