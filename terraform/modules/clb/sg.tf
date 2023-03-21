# sg
resource "tencentcloud_security_group" "clb_sg" {
  name        = "${var.name}-sg"
  description = "${var.name} clb security group"
}

# probably allocate a bastion and only allow ingress from bastion
resource "tencentcloud_security_group_lite_rule" "clb_sg_rules" {
  security_group_id = tencentcloud_security_group.clb_sg.id

  ingress = [
    "ACCEPT#0.0.0.0/0#ALL#ICMP",
    "ACCEPT#0.0.0.0/0#22#TCP",
    "ACCEPT#0.0.0.0/0#ALL#TCP",
    "ACCEPT#0.0.0.0/0#ALL#UDP",
  ]

  egress = [
    "ACCEPT#0.0.0.0/0#ALL#ALL",
  ]
}