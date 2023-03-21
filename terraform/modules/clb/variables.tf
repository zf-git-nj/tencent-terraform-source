variable "name" {
  default = "default-clb"
}
variable "network_type" {
    type = string
    default = "OPEN"
}
variable "clb_name" {}
variable "project_id" {
    default = 0
}
variable "vpc_id" {}
#variable "security_groups" {}
#variable "subnet_id" {}
variable "target_region_info_region" {}
variable "target_region_info_vpc_id" {}
variable "load_balancer_pass_to_target" {
    default = true
}