module "ckafka" {
  source           = "../../../../modules/ckafka"
  instance_name       = "bj-npr-ckafka-idc"
  zone_id             = 800006
  specifications_type = "standard"
  renew_flag          = 0 #no renew
  subnet_id           = module.vpc.protected_subnet
  vpc_id              = module.vpc.id

}