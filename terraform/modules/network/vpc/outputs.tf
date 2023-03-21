output "id" {
  value = tencentcloud_vpc.main_vpc.id
}
output "public_subnet" {
  value = tencentcloud_subnet.public_subnet.id
}
output "protected_subnet" {
  value = tencentcloud_subnet.protected_subnet.id
}
output "private_subnet" {
  value = tencentcloud_subnet.private_subnet.id
}
output "cidr_block" {
  value = tencentcloud_vpc.main_vpc.cidr_block
}