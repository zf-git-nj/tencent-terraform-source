# sg
resource "tencentcloud_security_group" "postgres_sg" {
  name        = "${var.name}-sg"
  description = "${var.name} postgres security group"
}

resource "tencentcloud_security_group_lite_rule" "postgres_sg_rules" {
  security_group_id = tencentcloud_security_group.postgres_sg.id

  ingress = [
    "ACCEPT#${var.protected_subnet_cidr}#ALL#ALL",
  ]

  egress = [
    "ACCEPT#0.0.0.0/0#ALL#ALL",
  ]
}