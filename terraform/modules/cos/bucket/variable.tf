variable "acl" {
  type    = string
  default = "private"
}
variable "policy" {
  default = "default_bucket_policy"
}
variable "encryption" {
  type    = string
  default = "AES256"
}
variable "versioning" {
  type    = string
  default = true
}
variable "bucket_name" {}
variable "region" {}
variable "app_id" {}