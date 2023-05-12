# tencent cloud postgresql
  resource "tencentcloud_postgresql_instance" "postgres" {
  name              = "postgres-${var.name}"
  availability_zone = var.availability_zone
  charge_type       = var.charge_type
  vpc_id            = tencentcloud_vpc.main_vpc.id
  subnet_id         = tencentcloud_subnet.private_subnet.id
  engine_version    = var.engine_version
  root_user         = var.root_user
  root_password     = var.password
  charset           = var.charset
  memory            = var.memory
  storage           = var.storage
  security_groups   = [tencentcloud_security_group.k8s_sg.id]
  backup_plan {
    min_backup_start_time        = var.min_backup_start_time
    max_backup_start_time        = var.max_backup_start_time
    base_backup_retention_period = var.base_backup_retention_period
    backup_period                = var.backup_period
  }
}