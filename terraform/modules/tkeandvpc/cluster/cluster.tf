# TKE cluster 
# TODO, evaluate EKS
# network https://cloud.tencent.com/document/product/457/50353
resource "tencentcloud_vpc" "vpc" {
  name         = var.vpc_name
  cidr_block   = var.vpc_cidr
  is_multicast = var.vpc_is_multicast
  dns_servers  = length(var.vpc_dns_servers) > 0 ? var.vpc_dns_servers : null
  tags         = var.vpc_tags
}

resource "tencentcloud_subnet" "subnet" {
  availability_zone = var.availability_zone
  name              = var.subnet_name
  vpc_id            = tencentcloud_vpc.vpc.id
  cidr_block        = var.cidr_block
  is_multicast      = var.is_multicast
}

resource "tencentcloud_kubernetes_cluster" "k8s_cluster" {
  vpc_id                                     = tencentcloud_vpc.vpc.id
  cluster_version                            = var.k8s_version
  cluster_cidr                               = var.cluster_cidr
  cluster_max_pod_num                        = 256
  cluster_name                               = var.name
  cluster_desc                               = "k8s main cluster"
  cluster_max_service_num                    = 2048
  cluster_internet                           = true
  #managed_cluster_internet_security_policies = ["0.0.0.0/0"] #TODO change this 
  cluster_internet_security_group            = tencentcloud_security_group.k8s_sg.id
  cluster_deploy_type                        = "MANAGED_CLUSTER"
  cluster_os                                 = "ubuntu18.04.1x86_64"
  container_runtime                          = "containerd"
  network_type                               = "GR" # "VPC-CNI"
  deletion_protection                        = false # can disable from UI
  
  worker_config {
    instance_name              = "${var.name}-node"
    public_ip_assigned         = false # TODO, disable public ip and access through bastion
    subnet_id                  = tencentcloud_subnet.subnet.id # TODO, put it in protected subnet
    security_group_ids         = [tencentcloud_security_group.k8s_sg.id]
    availability_zone          = var.az
    instance_type              = var.default_instance_type
    system_disk_type           = "CLOUD_PREMIUM"
    system_disk_size           = 50
    #internet_max_bandwidth_out = 10
    internet_charge_type       = "TRAFFIC_POSTPAID_BY_HOUR"
    enhanced_security_service  = true
    enhanced_monitor_service   = true
    password                   = var.password
  }
  depends_on = [tencentcloud_vpc.vpc]
}

# Node pool for autoscaling
resource "tencentcloud_kubernetes_node_pool" "node_pool" {
  name                 = "${var.name}-pool"
  cluster_id           = tencentcloud_kubernetes_cluster.k8s_cluster.id
  max_size             = 10
  min_size             = 0
  vpc_id               = tencentcloud_vpc.vpc.id
  subnet_ids           = [tencentcloud_subnet.subnet.id] # TODO, put it in protected subnet
  retry_policy         = "INCREMENTAL_INTERVALS"
  desired_capacity     = 1
  enable_auto_scale    = true
  delete_keep_instance = false
  node_os              = "ubuntu18.04.1x86_64"

  auto_scaling_config {
    instance_type      = var.default_instance_type
    system_disk_type   = "CLOUD_PREMIUM"
    system_disk_size   = "50"
    security_group_ids = [tencentcloud_security_group.k8s_sg.id]

    #data_disk {
    #  disk_type = "CLOUD_PREMIUM"
    #  disk_size = 50
    #}

    internet_charge_type       = "TRAFFIC_POSTPAID_BY_HOUR"
    #internet_max_bandwidth_out = 10
    public_ip_assigned         = false # TODO, disable public ip and access through bastion
    password                   = var.password
    enhanced_security_service  = true
    enhanced_monitor_service   = true
  }
  depends_on = [tencentcloud_vpc.vpc, tencentcloud_subnet.subnet]
}