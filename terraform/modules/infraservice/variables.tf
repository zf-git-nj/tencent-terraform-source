variable "name" {
  default = "kube-provision-cluster-test"
  type    = string
}

variable "availability_zone" {
  description = "The availability zone within which the subnet should be created."
  default     = "ap-beijing-6"
  type        = string
}

variable "region_code" {
  default = "bj"
  type    = string
}

variable "env_name" {
  default = "nonprod"
  type    = string
}

variable "k8s_version" {
  description = "Version of the cluster"
  default     = "1.22.5"
}

variable "vpc_cidr" {
  description = "A network address block which should be a subnet of the three internal network segments (10.0.0.0/16, 172.16.0.0/12 and 192.168.0.0/16)."
  default     = "10.1.0.0/16"
  type        = string
}

variable "cluster_cidr" {
  description = "A network address block of the cluster. Different from vpc cidr and cidr of other clusters within this vpc. Must be in 10./192.168/172.[16-31] segments."
  # cidr for pod/service etc
  # ip for node is within the vpc
  # max pod per node 256
  # max services 2048
  # max nodes 248
  default     = "192.168.0.0/16"
}

variable "default_instance_type" {
  description = "Specified types of CVM instance."
  default     = "SA2.MEDIUM2"
}

variable "cidr_block" {
  description = "Subnet CIDR block"
  default = "172.16.0.0/24"
  type = string
}

variable "password" { 
  default = "Default@pass1"
}
