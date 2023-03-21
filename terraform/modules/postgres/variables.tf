variable "name" {}
variable "availability_zone" {
  default = "ap-beijing-6"
}
variable "charge_type" {
  default="POSTPAID_BY_HOUR"
}
variable "vpc_id" {}
variable "subnet_id" {}
variable "engine_version" {
  default="10.4"
}
variable "root_user" {
  default="postgresuser"
}
variable "root_password" { 
  # TODO: actual password from ssm
  default="Default@pass1"
}
variable "charset" {
  default="UTF8"
}
variable "memory" {}
variable "storage" {}
variable "min_backup_start_time" {
  default="00:00:01"
}
variable "max_backup_start_time" {
  default="01:00:01"
}
variable "base_backup_retention_period" {
  default="7"
}
variable "backup_period" {
  #default=["monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"]
  default=["saturday", "sunday"]
}
variable "protected_subnet_cidr" {}