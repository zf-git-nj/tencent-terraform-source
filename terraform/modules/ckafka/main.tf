resource "tencentcloud_ckafka_instance" "ckafka_instance" {
  band_width          = 40
  disk_size           = 500
  disk_type           = "CLOUD_BASIC"
  period              = 1
  instance_name       = var.instance_name
  specifications_type = var.specifications_type
  kafka_version       = "1.1.1"
  msg_retention_time  = var.msg_retention_time
  multi_zone_flag     = false
  partition           = 60
  renew_flag          = var.renew_flag
  subnet_id           = var.subnet_id
  vpc_id              = var.vpc_id
  zone_id             = var.zone_id 

#  config {
#    auto_create_topic_enable   = true
#    default_num_partitions     = 3
#    default_replication_factor = 3
#  }

#  dynamic_retention_config {
#    bottom_retention        = 0
#    disk_quota_percentage   = 0
#    enable                  = 1
#    step_forward_percentage = 0
#  }
}