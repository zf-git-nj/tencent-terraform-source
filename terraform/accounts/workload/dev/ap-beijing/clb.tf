module "clb" {
  source                    = "../../../../modules/clb"
  clb_name                  = "clb-public-npr-idc"
  vpc_id                    = module.vpc.id
#  subnet_id                 = module.vpc.public_subnet #internal clb only
  target_region_info_region = var.region
  target_region_info_vpc_id = module.vpc.id
}