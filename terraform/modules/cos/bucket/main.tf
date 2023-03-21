# Bucket
resource "tencentcloud_cos_bucket" "bucket" {
  bucket = var.bucket_name
  acl    = var.acl
  encryption_algorithm = var.encryption
  versioning_enable = var.versioning
}

# Bucket policy
#resource "tencentcloud_cos_bucket_policy" "bucket_policy" {
#  bucket = var.bucket_name
#  policy = templatefile("${path.module}/policies/${var.policy}.json", {
#    bucket_name  = var.bucket_name,
#    region = var.region,
#    app_id = var.app_id
#  })
#  #depends_on = [tencentcloud_cos_bucket.bucket]
#}