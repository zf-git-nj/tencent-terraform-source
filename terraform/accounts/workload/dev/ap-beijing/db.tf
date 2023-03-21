# TODO, probably add RO group
module "postgres" {
  source                       = "../../../../modules/postgres"
  name                         = "postgres-db"
  vpc_id                       = module.vpc.id
  subnet_id                    = module.vpc.private_subnet
  memory                       = 2
  storage                      = 50
  protected_subnet_cidr        = cidrsubnet(var.vpc_cidr, 4, 2)
  #root_password                = module.postgre_password.result
}