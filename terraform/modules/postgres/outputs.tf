output "id" {
  value = tencentcloud_postgresql_instance.postgres.id
}

output "private_access_ip" {
  value = tencentcloud_postgresql_instance.postgres.private_access_ip
}

output "private_access_port" {
  value = tencentcloud_postgresql_instance.postgres.private_access_port
}

output "public_access_host" {
  value = tencentcloud_postgresql_instance.postgres.public_access_host
}

output "public_access_port" {
  value = tencentcloud_postgresql_instance.postgres.public_access_port
}