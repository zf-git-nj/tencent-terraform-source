#just some basic test for import
resource "tencentcloud_cam_role" "my_TKE_QCSRole" {
  name          = "my_TKE_QCSRole"
 }

resource "tencentcloud_cam_role" "my_TCR_QCSRole" {
  name          = "my_TCR_QCSRole"
}   

resource "tencentcloud_cam_role" "my_AS_QCSRole" {
  name          = "my_AS_QCSRole"
}

#Policies for roles
resource "tencentcloud_cam_policy" "my_TKE_QCSRole_QcloudAccessForTKERoleInOpsManagement" {
  name          = "my_TKE_QCSRole_QcloudAccessForTKERoleInOpsManagement"
}
