# TF backend bucket
module "tf_backend_bucket" {
  source = "../modules/cos/bucket"
  bucket_name = "${var.account_name}-terraform-backend-bucket-${var.app_id}"
  region = var.region
  app_id = var.app_id
}