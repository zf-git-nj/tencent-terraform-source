variable "instance_name" {}
variable "specifications_type" {
    default = "standard"
}
variable "msg_retention_time" {
    #7 days
    default = 10080
}
variable "vpc_id" {}
variable "subnet_id" {}
variable "zone_id" {
    #zone beijing 6, https://www.tencentcloud.com/document/product/239/4106
    default = 800006
}
variable "renew_flag" {
    default = 0
}