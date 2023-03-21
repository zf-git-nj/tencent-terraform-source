resource "tencentcloud_tcr_instance" "tcr_instance" {
  name          = var.name
  instance_type = var.instance_type
  open_public_operation = true
  delete_bucket = var.delete_bucket
  security_policy {
    cidr_block = "0.0.0.0/0"
  }
}

resource "tencentcloud_tcr_namespace" "tcr_namespace" {
  instance_id = tencentcloud_tcr_instance.tcr_instance.id
  name        = "helm"
}

resource "tencentcloud_tcr_token" "tcr_token" {
  instance_id = tencentcloud_tcr_instance.tcr_instance.id
  description = "long term access token"
}