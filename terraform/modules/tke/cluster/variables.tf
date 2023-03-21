
variable "name" {
  default = "default-cluster"
}

variable "vpc_id" {}

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

variable "c_subnet" {}

variable "password" { 
  # TODO: actual password from ssm
  default = "Default@pass1"
}

variable "az" {
  default = "ap-beijing-6"
}