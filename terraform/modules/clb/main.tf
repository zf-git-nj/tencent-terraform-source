resource "tencentcloud_clb_instance" "open_clb" {
  network_type              = var.network_type
  clb_name                  = var.clb_name
  project_id                = 0
  vpc_id                    = var.vpc_id
#  subnet_id                 = var.subnet_id #internal only
  security_groups           = [tencentcloud_security_group.clb_sg.id]
  load_balancer_pass_to_target = var.load_balancer_pass_to_target
  target_region_info_region = var.target_region_info_region
  target_region_info_vpc_id = var.target_region_info_vpc_id
}