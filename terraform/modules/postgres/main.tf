# create postgresql
# TODO, add RO group later
resource "tencentcloud_postgresql_instance" "postgres" {
  name              = var.name
  availability_zone = var.availability_zone
  charge_type       = var.charge_type 
  vpc_id            = var.vpc_id
  subnet_id         = var.subnet_id
  engine_version    = var.engine_version
  root_user         = var.root_user
  root_password     = var.root_password
  charset           = var.charset
  memory            = var.memory
  storage           = var.storage
  security_groups   = [tencentcloud_security_group.postgres_sg.id]

  backup_plan {
    min_backup_start_time        = var.min_backup_start_time
    max_backup_start_time        = var.max_backup_start_time
    base_backup_retention_period = var.base_backup_retention_period
    backup_period                = var.backup_period
  }
}