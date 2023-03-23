variable "vpc_name" {
  description = "The vpc name used to launch a new vpc when 'vpc_id' is not specified."
  default     = "tf-modules-vpc"
  type        = string
}

variable "vpc_cidr" {
  description = "The cidr block used to launch a new vpc when 'vpc_id' is not specified."
  default     = "172.16.0.0/16"
  type        = string
}

variable "vpc_is_multicast" {
  description = "Specify the vpc is multicast when 'vpc_id' is not specified."
  default     = true
  type        = bool
}

variable "vpc_dns_servers" {
  description = "Specify the vpc dns servers when 'vpc_id' is not specified."
  type        = list(string)
  default     = []
}

variable "vpc_tags" {
  description = "Additional tags for the vpc."
  type        = map(string)
  default     = {}
}

variable "availability_zone" {
  description = "Availability Zone"
  default = "ap-beijing-6"
  type = string
}

variable "name" {
  default = "default-cluster"
}

variable "k8s_version" {
  default = "1.20.6"
}

variable "cluster_cidr" {
  # cidr for pod/service etc
  # ip for node is within the vpc
  # max pod per node 256
  # max services 2048
  # max nodes 248
  default = "192.168.0.0/16"
}

variable "default_instance_type" {
  default = "SA3.MEDIUM8"
}

variable "subnet_name" {
  description = "Subnet name"
  default = "guagua-ci-temp-test"
  type = string
}

variable "cidr_block" {
  description = "Subnet CIDR block"
  default = "172.16.0.0/24"
  type = string
}

variable "is_multicast" {
  description = "Subnet is multicast"
  default = false
  type = bool
}

variable "password" { 
  # TODO: actual password from ssm
  default = "Default@pass1"
}

variable "az" {
  default = "ap-beijing-6"
}