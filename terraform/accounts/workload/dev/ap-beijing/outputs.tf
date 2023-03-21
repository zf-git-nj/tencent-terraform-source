#VPC
output "main_vpc_id" {
    value = module.vpc.id
}

output "main_vpc_cidr" {
    value = module.vpc.cidr_block
}

output "main_vpc_public_subnet" {
    value = module.vpc.public_subnet
}

output "main_vpc_private_subnet" {
    value = module.vpc.private_subnet
}

#Cluster
output "cluster_id" {
    value = module.tke.id
}

output "cluster_kube_config" {
    value = module.tke.kube_config
}

output "cluster_kube_config_intranet" {
    value = module.tke.kube_config_intranet
}

output "cluster_certification_authority" {
    value = module.tke.certification_authority
}

output "cluster_user_name" {
    value = module.tke.user_name
}

output "cluster_cluster_external_endpoint" {
    value = module.tke.cluster_external_endpoint
}
output "cluster_pgw_endpoint" {
    value = module.tke.pgw_endpoint
}

output "cluster_security_policy" {
    value = module.tke.security_policy
}

#CLB
output "clb_id" {
    value = module.clb.id
}

output "clb_clb_vips" {
    value = module.clb.clb_vips
}

output "clb_vip_isp" {
    value = module.clb.vip_isp
}

#TCR
output "tcr_id" {
    value = module.tcr.id
}

output "tcr_token_id" {
    value = module.tcr.token_id
}

output "tcr_token" {
    value = module.tcr.token
}

output "tcr_user_name" {
    value = module.tcr.user_name
}