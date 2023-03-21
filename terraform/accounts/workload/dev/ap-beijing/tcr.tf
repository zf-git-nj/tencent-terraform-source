module "tcr" {
  source           = "../../../../modules/tcr"
  name             = "tencent-edge-dev-sample-tcr"
  instance_type    = "basic"
  delete_bucket    = true
}